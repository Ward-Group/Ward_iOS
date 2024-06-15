//
//  LoginViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 5/27/24.
//

import Foundation
import Combine

struct LoginViewModel {
    let authUsecase: AuthUseCase
    let router: LoginRouter
}

extension LoginViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let userTrigger: Driver<UserFromLoginProvider>
        
        init(userTrigger: Driver<UserFromLoginProvider>) {
            self.userTrigger = userTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var alert = false
        let dismissTrigger = PassthroughSubject<Void, Never>()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        input.userTrigger
            .sink { user in
                handleLogin(user: user, output: output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        return output
    }
}

extension LoginViewModel {
    
    private func handleLogin(user: UserFromLoginProvider, output: Output, cancelBag: CancelBag) {
        let dto = LoginDto(provider: user.loginProvider, providerId: user.providerId)
        authUsecase.login(dto: dto)
            .sink { completion in
                handleLoginCompletion(completion: completion, output: output, user: user)
            } receiveValue: { response in
                handleLoginResponse(response: response, dto: dto, output: output)
            }
            .store(in: cancelBag)
    }
    
    private func handleLoginResponse(response: AuthResponse, dto: LoginDto, output: Output) {
        authUsecase.updateToken(accessToken: response.accessToken, refreshToken: response.refreshToken)
        authUsecase.updateLoginDto(dto: dto)
        output.dismissTrigger.send()
    }
    
    private func handleLoginCompletion(completion: Subscribers.Completion<AuthError>, output: Output, user: UserFromLoginProvider) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            self.handleError(error: error, user: user)
        }
    }
    
    private func handleError(error: Error, user: UserFromLoginProvider) {
        switch error as? AuthError {
        case .needSignUp, .unknown:
            router.push(.signUp(user))
            return
        default:
            break
        }
    }
}
