//
//  LoginFeature.swift
//  WardApp
//
//  Created by peppermint100 on 5/7/24.
//

import Foundation
import ComposableArchitecture
import AuthenticationServices
import KakaoSDKAuth
import KakaoSDKUser

@Reducer
struct LoginFeature {
    
    @ObservableState
    struct State: Equatable {
    }
    
    enum Action {
        case appleLoginOnRequest(_ request: ASAuthorizationAppleIDRequest)
        case appleLoginOnComplete(_ result: Result<ASAuthorization, Error>)
        case kakaoLoginButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .appleLoginOnRequest(let request):
                request.requestedScopes = [.fullName, .email]
                return .none
            case .appleLoginOnComplete(let result):
                self.handleAppleSignIn(result: result)
                return .none
            case .kakaoLoginButtonTapped:
                self.handleKakaoSignIn()
                return .none
            }
        }
    }
}

private extension LoginFeature {
    func handleAppleSignIn(result: Result<ASAuthorization, Error>) {
        do {
            let authResult = try result.get()
            guard let appleIDCredential = authResult.credential as? ASAuthorizationAppleIDCredential else { return }
            let fullName = appleIDCredential.fullName
            let name = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
            let email = appleIDCredential.email
            let identityTokenData = appleIDCredential.identityToken!
            let identityToken = String(data: identityTokenData, encoding: .utf8)
            print(name, email, identityToken)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func handleKakaoSignIn() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                UserApi.shared.me { user, error in
                    guard
                        error == nil,
                        let account = user?.kakaoAccount,
                        let profile = account.profile,
                        let nickname = profile.nickname,
                        let mail = account.email,
                        let providerId = user?.id
                    else { return }
                    print(nickname, mail, providerId)
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                UserApi.shared.me { user, error in
                    guard
                        error == nil,
                        let account = user?.kakaoAccount,
                        let profile = account.profile,
                        let nickname = profile.nickname,
                        let mail = account.email,
                        let providerId = user?.id
                    else { return }
                    print(nickname, mail, providerId)
                }
            }
        }
    }
}
