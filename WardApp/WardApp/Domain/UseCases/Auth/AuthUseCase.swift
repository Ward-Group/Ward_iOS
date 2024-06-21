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
        Log.debug("\(dto.provider) 으로 로그인합니다.")
        return repository.login(dto: dto)
    }
    
    /// LoginView에서 새로 로그인. 가지고 있는 정보 없이 애플, 카카오에 요청해서 로그인하므로 로그인 dto를 받으면 Defaults와 Keychain에 저장
    func login(dto: LoginDto) -> AnyPublisher<AuthResponse, AuthError> {
        Log.debug(#file, #function, "\(dto.provider) 으로 로그인합니다.")
        updateLoginDto(dto: dto)
        return repository.login(dto: dto)
    }
    
    func loadEmail() -> String {
        return UserRepository.shared.getEmail()
    }
    
    private func loadLoginDto() -> LoginDto {
        let provider = UserRepository.shared.getLoginProvider()
        let providerId = UserRepository.shared.getProviderId()
        let email = UserRepository.shared.getEmail()
        
        return LoginDto(provider: provider, providerId: providerId)
    }
    
    func updateToken(accessToken: String, refreshToken: String) {
        UserRepository.shared.updateAcceesToken(accessToken)
        UserRepository.shared.updateRefreshToken(refreshToken)
    }
    
    func updateLoginDto(dto: LoginDto) {
        UserRepository.shared.updateLoginProvider(dto.provider)
        UserRepository.shared.updateLoginProvicerId(dto.providerId)
    }
}

extension AuthUseCase {
    func signUp(dto: SignUpDto) -> AnyPublisher<AuthResponse, AuthError> {
        return repository.signUp(dto: dto)
    }
}

extension AuthUseCase {
    func checkNickname(nickname: String) -> AnyPublisher<Bool, AuthError> {
        return repository.checkNickname(dto: CheckNicknameDto(nickname: nickname))
    }
}

extension AuthUseCase {
    
    func logOut() -> AnyPublisher<String?, AuthError> {
        let result = requestLogOut()
        clearUserInformation()
        return result
    }
    
    private func clearUserInformation() {
        UserRepository.shared.updateEmail("")
        UserRepository.shared.updateNickname("")
        UserRepository.shared.updateAcceesToken("")
        UserRepository.shared.updateRefreshToken("")
        UserRepository.shared.updateLoginProvider(LoginProvider.unknown)
        UserRepository.shared.updateLoginProvicerId("")
    }
    
    private func requestLogOut() -> AnyPublisher<String?, AuthError> {
        let accessToken = UserRepository.shared.getAccessToken()
        let refreshToken = UserRepository.shared.getRefreshToken()
        return repository.logOut(accessToken: accessToken, refreshToken: refreshToken)
    }
}
