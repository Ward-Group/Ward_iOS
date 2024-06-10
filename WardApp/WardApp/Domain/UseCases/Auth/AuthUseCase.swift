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
    
    func login() -> AnyPublisher<LoginResponse, AuthError> {
        let dto = loadLoginDto()
        Log.debug("\(dto.provider) - \(dto.providerId) - \(String(describing: dto.email)) 으로 로그인합니다.")
        return repository.login(dto: dto)
    }
    
    func login(provider: LoginProvider, providerId: String, email: String) -> AnyPublisher<LoginResponse, AuthError> {
        let dto = LoginDto(provider: provider, providerId: providerId, email: email)
        Log.debug("\(dto.provider) - \(dto.providerId) - \(String(describing: dto.email)) 으로 로그인합니다.")
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
