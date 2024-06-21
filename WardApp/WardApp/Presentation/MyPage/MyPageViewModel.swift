//
//  MyPageViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import Foundation
import Combine

struct MyPageViewModel {
    let authUseCase: AuthUseCase
}

extension MyPageViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let logOutButtonTrigger: Driver<Void>
        let logOutSuccessTrigger: PassthroughSubject<Void, Never>
        
        init(logOutButtonTrigger: Driver<Void>, logOutSuccessTrigger: PassthroughSubject<Void, Never>) {
            self.logOutButtonTrigger = logOutButtonTrigger
            self.logOutSuccessTrigger = logOutSuccessTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var nickname = "닉네임"
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.logOutButtonTrigger
            .sink {
                authUseCase.logOut()
                    .sink { completion in
                        handleLogOutCompletion(completion)
                    } receiveValue: { _ in
                        handleLogOutResponse(input: input)
                    }
                    .store(in: cancelBag)
            }
            .store(in: cancelBag)
        
        return output
    }
}

private extension MyPageViewModel {
    
    func handleLogOutCompletion(_ completion: Subscribers.Completion<AuthError>) {
        switch completion {
        case .finished:
            break
        case .failure(let failure):
            break
        }
    }
    
    func handleLogOutResponse(input: Input) {
        input.logOutSuccessTrigger.send()
    }
}
