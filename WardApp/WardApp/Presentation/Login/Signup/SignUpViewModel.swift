//
//  SignUpViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/9/24.
//

import Foundation
import Combine

struct SignUpViewModel {
    let authUsecase: AuthUseCase
    
    init(authUsecase: AuthUseCase) {
        self.authUsecase = authUsecase
    }
}

extension SignUpViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let signUpButtonTrigger: Driver<Void>
        let signUpCompletionTrigger: PassthroughSubject<Void, Never>
        
        init(signUpButtonTrigger: Driver<Void>, signUpCompletionTrigger: PassthroughSubject<Void, Never>) {
            self.signUpButtonTrigger = signUpButtonTrigger
            self.signUpCompletionTrigger = signUpCompletionTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var nickname = ""
        
        @Published var generalToggle = false
        @Published var ageToggle = false
        @Published var serviceAgreementToggle = false
        @Published var personalInfoCollectToggle = false
        @Published var personalInfoMarketingToggle = false
        
        @Published var notificationGeneralToggle = false
        @Published var emailNotificationToggle = false
        @Published var smsNotificationToggle = false
        @Published var appPushNotificationToggle = false
        
        @Published var disableSignUpButton = true
        @Published var isSigningIn = false
        @Published var isNicknameDuplicated = false
        @Published var isCheckingNickname = false
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        output.$notificationGeneralToggle.sink { value in
            toggleAllNotifications(to: value, output: output)
        }
        .store(in: cancelBag)
        
        output.$generalToggle.sink { value in
            toggleAll(to: value, output: output)
        }
        .store(in: cancelBag)
        
        output.$ageToggle
            .combineLatest(output.$serviceAgreementToggle, output.$personalInfoCollectToggle, output.$isNicknameDuplicated)
            .map { !($0 && $1 && $2 && !$3) }
            .assign(to: \.disableSignUpButton, on: output)
            .store(in: cancelBag)
        
        input.signUpButtonTrigger
            .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink {
                signUp(input: input, output: output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        
        output.$nickname
            .sink { _ in
                if !output.nickname.isEmpty {
                    output.isCheckingNickname = true
                } else {
                    output.isCheckingNickname = false
                }
            }
            .store(in: cancelBag)
        
        output.$nickname
            .debounce(for: 2, scheduler: DispatchQueue.main)
            .sink { nickname in
                checkNickname(nickname: nickname, output: output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        
        return output
    }
    
    private func toggleAll(to value: Bool, output: Output) {
        output.ageToggle = value
        output.serviceAgreementToggle = value
        output.personalInfoCollectToggle = value
        output.personalInfoMarketingToggle = value
        output.notificationGeneralToggle = value
    }
    
    private func toggleAllNotifications(to value: Bool, output: Output) {
        output.emailNotificationToggle = value
        output.smsNotificationToggle = value
        output.appPushNotificationToggle = value
    }
}

extension SignUpViewModel {
    private func signUp(input: Input, output: Output, cancelBag: CancelBag) {
        authUsecase.signUp(
            name: output.nickname, nickname: output.nickname, emailNotification: output.emailNotificationToggle,
            smsNotification: output.smsNotificationToggle, appPushNotification: output.appPushNotificationToggle
        )
        .sink { completion in
            handleSignUpCompletion(completion: completion, output: output)
        } receiveValue: { value in
            handleSignUpResponse(value: value)
            input.signUpCompletionTrigger.send()
        }
        .store(in: cancelBag)
    }
    
    private func checkNickname(nickname: String, output: Output, cancelBag: CancelBag) {
        if nickname != "" && !nickname.isEmpty {
            authUsecase.checkNickname(nickname: nickname)
                .sink(receiveCompletion: { completion in
                    handleCheckNicknameCompletion(completion: completion, output: output)
                }, receiveValue: { value in
                    handleCheckNicknameResponse(value: value, output: output)
                })
                .store(in: cancelBag)
        }
    }
}

extension SignUpViewModel {
    
    private func handleCheckNicknameResponse(value duplicated: Bool, output: Output) {
        Log.debug(#file, #function, duplicated)
        output.isNicknameDuplicated = duplicated
    }
    
    private func handleCheckNicknameCompletion(completion: Subscribers.Completion<AuthError>, output: Output) {
        output.isCheckingNickname = false
        
        switch completion {
        case .finished:
            break
        case .failure:
            output.isNicknameDuplicated = true
        }
    }
    
    private func handleSignUpResponse(value: AuthResponse) {
        authUsecase.updateToken(accessToken: value.accessToken, refreshToken: value.refreshToken)
    }
    
    private func handleSignUpCompletion(completion: Subscribers.Completion<AuthError>, output: Output) {
        output.isSigningIn = false
        
        switch completion {
        case .finished:
            break
            // TODO: 에러 관련 기획나오면 에러처리
        case .failure(_):
            break
        }
    }
}
