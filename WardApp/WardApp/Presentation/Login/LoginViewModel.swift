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
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        return output
    }
}

extension LoginViewModel {
    
    private func handleLoginResponse(response: AnyPublisher<LoginResponse, AuthError>, output: Output) {
    }
    
    private func handleLoginCompletion(completion: Subscribers.Completion<Never>, output: Output) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            self.handleError(error: error)
        }
    }
    
    private func handleError(error: Error) {
        switch error as? AuthError {
        case .needSignUp:
            router.push(.signUp)
            return
        default:
            router.push(.signUp)
            return
        }
    }
}
