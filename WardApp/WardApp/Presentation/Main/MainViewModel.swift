//
//  MainViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation
import Combine

struct MainViewModel {
    let authUsecase: AuthUseCase
    let router: MainRouter
}

extension MainViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let loadTrigger: AnyPublisher<Void, Never>
        
        init(loadTrigger: AnyPublisher<Void, Never>) {
            self.loadTrigger = loadTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var isLoggingIn = true
        @Published var isLoggedIn = false
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.loadTrigger
            .sink {
                handleLogin(output: output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        
        return output
    }
}

extension MainViewModel {
    
    private func handleLogin(output: Output, cancelBag: CancelBag) {
        authUsecase.login()
            .sink(
                receiveCompletion: { completion in
                    handleLoginCompletion(completion: completion, output: output)
                },
                receiveValue: { response in
                    handleLoginResponse(response: response)
                })
            .store(in: cancelBag)
    }
    
    /// 로그인 성공
    private func handleLoginResponse(response: AuthResponse) {
        authUsecase.updateToken(accessToken: response.accessToken, refreshToken: response.refreshToken)
    }
    
    /// 로그인 완료 시 실행 실패 여부 확인
    private func handleLoginCompletion(completion: Subscribers.Completion<AuthError>, output: Output) {
        output.isLoggingIn = false
        switch completion {
        case .finished:
            break
        case .failure(let error):
            switch error {
            case .needSignUp, .invalidInput:
                router.present(fullScreenSheet: .login)
            default:
                // TODO: 이 후에 각자 에러 처리 해줄 것
                break
            }
        }
    }
}
