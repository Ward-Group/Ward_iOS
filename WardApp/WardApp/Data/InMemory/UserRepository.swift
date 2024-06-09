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
    
    func getAccessToken() -> String {
        guard let token = UserDefaults.standard.string(forKey: UserDefaultsKey.accessToken) else {
            return ""
        }
        return token
    }
    
    func getRefreshToken() -> String {
        guard let token = UserDefaults.standard.string(forKey: UserDefaultsKey.refreshToken) else {
            return ""
        }
        return token
    }
    
    func updateLoginProvider(_ provider: LoginProvider) {
        UserDefaults.setValue(provider, forKey: UserDefaultsKey.loginProvider)
    }
    
    func updateAcceesToken(_ token: String) {
        UserDefaults.standard.setValue(token, forKey: UserDefaultsKey.accessToken)
    }
    
    func updateRefreshToken(_ token: String) {
        UserDefaults.standard.setValue(token, forKey: UserDefaultsKey.refreshToken)
    }
    
    func updateEmail(_ email: String) {
        UserDefaults.standard.setValue(email, forKey: UserDefaultsKey.email)
    }
}
