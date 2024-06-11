//
//  AuthUseCase.swift
//  WardApp
//
//  Created by peppermint100 on 5/15/24.
//

import Foundation
import Combine

struct AuthUseCase {
    let repository: AuthRepository
}

extension AuthUseCase {
    
    /// MainView에서 이미 로그인한 사용자인지 아닌지 확인, 즉 Defaults와 Keychain에 가지고 있는 정보로 로그인
    func login() -> AnyPublisher<AuthResponse, AuthError> {
        let dto = loadLoginDto()
        Log.debug("\(dto.provider) - \(String(describing: dto.email)) 으로 로그인합니다.")
        return repository.login(dto: dto)
    }
    
    /// LoginView에서 새로 로그인. 가지고 있는 정보 없이 애플, 카카오에 요청해서 로그인하므로 로그인 dto를 받으면 Defaults와 Keychain에 저장
    func login(user: UserFromLoginProvider) -> AnyPublisher<AuthResponse, AuthError> {
        let dto = LoginDto(provider: user.loginProvider, providerId: user.providerId, email: user.email)
        Log.debug(#file, #function, "\(dto.provider) - \(String(describing: dto.email)) 으로 로그인합니다.")
        updateLoginDto(dto: dto)
        return repository.login(dto: dto)
    }
    
    private func loadLoginDto() -> LoginDto {
        let provider = UserRepository.shared.getLoginProvider()
        let providerId = UserRepository.shared.getProviderId()
        let email = UserRepository.shared.getEmail()
        
        return LoginDto(provider: provider, providerId: providerId, email: email)
    }
    
    func updateToken(accessToken: String, refreshToken: String) {
        UserRepository.shared.updateAcceesToken(accessToken)
        UserRepository.shared.updateRefreshToken(refreshToken)
    }
    
    func updateLoginDto(dto: LoginDto) {
        UserRepository.shared.updateEmail(dto.email)
        UserRepository.shared.updateLoginProvider(dto.provider)
        UserRepository.shared.updateLoginProvicerId(dto.providerId)
    }
}

extension AuthUseCase {
    func signUp(name: String, nickname: String, emailNotification: Bool, smsNotification: Bool, appPushNotification: Bool) -> AnyPublisher<AuthResponse, AuthError> {
        let loginDto = loadLoginDto()
        let signUpDto = SignUpDto(
            provider: loginDto.provider, providerId: loginDto.providerId, name: name,
            email: loginDto.email, nickname: nickname, emailNotification: emailNotification, snsNotification: smsNotification, appPushNotification: appPushNotification)
        
        return repository.signUp(dto: signUpDto)
    }
}

extension AuthUseCase {
    func checkNickname(nickname: String) -> AnyPublisher<Bool, AuthError> {
        return repository.checkNickname(dto: CheckNicknameDto(nickname: nickname))
    }
}
