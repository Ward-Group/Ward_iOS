//
//  TokensRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation

class UserRepository {
    
    static let shared = UserRepository()
    private init() {}
    
    func getEmail() -> String {
        guard let email = UserDefaults.standard.string(forKey: UserDefaultsKey.email) else {
            return ""
        }
        return email
    }
    
    func getLoginProvider() -> LoginProvider {
        guard
            let providerString = UserDefaults.standard.string(forKey: UserDefaultsKey.loginProvider),
            let provider = LoginProvider(rawValue: providerString)
        else {
            return .unknown
        }
        
        return provider
    }
    
    func getProviderId() -> String {
        guard let providerId = UserDefaults.standard.string(forKey: UserDefaultsKey.loginProviderId) else {
            return ""
        }
        return providerId
    }
    
    func getAccessToken() -> String {
        guard let token = KeychainManager.shared.read(key: KeychainKey.accessToken) else {
            return ""
        }
        
        return token
    }
    
    func getRefreshToken() -> String {
        guard let token = KeychainManager.shared.read(key: KeychainKey.refreshToken) else {
            return ""
        }
        
        return token
    }
    
    func updateLoginProvider(_ provider: LoginProvider) {
        UserDefaults.standard.setValue(provider.rawValue, forKey: UserDefaultsKey.loginProvider)
    }
    
    func updateAcceesToken(_ token: String) {
        _ = KeychainManager.shared.save(key: KeychainKey.accessToken, value: token)
    }
    
    func updateRefreshToken(_ token: String) {
        _ = KeychainManager.shared.save(key: KeychainKey.refreshToken, value: token)
    }
    
    func updateEmail(_ email: String) {
        UserDefaults.standard.setValue(email, forKey: UserDefaultsKey.email)
    }
        
    func updateLoginProvicerId(_ providerId: String) {
        UserDefaults.standard.setValue(providerId, forKey: UserDefaultsKey.loginProviderId)
    }
}
