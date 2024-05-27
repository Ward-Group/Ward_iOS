//
//  LoginViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 5/27/24.
//

import Foundation
import Combine

struct LoginViewModel: ViewModel {
    
    private let authUsecase: AuthUseCase
    
    init(authUsecase: AuthUseCase) {
        self.authUsecase = authUsecase
    }
    
    final class Input: ObservableObject {
        let userTrigger: PassthroughSubject<UserFromLoginProvider, Never>
        
        init(userTrigger: PassthroughSubject<UserFromLoginProvider, Never>) {
            self.userTrigger = userTrigger
        }
    }
    
    final class Output: ObservableObject {
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.userTrigger
            .handleEvents(receiveOutput: { user in
                self.authUsecase.login(user: user)
            })
            .sink()
            .store(in: cancelBag)
        
        return output
    }
}
