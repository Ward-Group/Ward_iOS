//
//  LoginView.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI
import Combine
import AuthenticationServices
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct LoginView: View {
    
    @ObservedObject var input: LoginViewModel.Input
    @ObservedObject var output: LoginViewModel.Output
    let cancelBag = CancelBag()
    
    let userTrigger = PassthroughSubject<UserFromLoginProvider, Never>()
    
    init(vm: LoginViewModel) {
        let input = LoginViewModel.Input(
            userTrigger: userTrigger
        )
        output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                appleLoginButton
                kakaoLoginButton
            }
        }
    }
}

#Preview {
    let vm: LoginViewModel = LoginAssemblerImpl().resolve()
    return LoginView(vm: vm)
}

// TODO: Color Guide, 폰트 설정 세팅되면 색상, 폰트 설정 변경
// MARK: Apple Login
extension LoginView {
    private var appleLoginButton: some View {
        ZStack {
            Color.black
            HStack {
                WardAssets.Image.appleLoginLogo.swiftUIImage
                    .foregroundStyle(.black)
                Text(WardStrings.loginWithApple)
                    .foregroundStyle(Color.white)
            }
        }
        .frame(width: 325, height: 60)
        .cornerRadius(16)
        .overlay {
            SignInWithAppleButton(
                onRequest: appleLoginOnRequest,
                onCompletion: appleLoginOnCompletion
            )
            .blendMode(.overlay)
        }
    }
    
    private func appleLoginOnRequest(request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.email, .fullName]
    }
    
    private func appleLoginOnCompletion(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResults):
            switch authResults.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                let fullName = appleIDCredential.fullName
                let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                let email = appleIDCredential.email
                if let identityTokenData = appleIDCredential.identityToken {
                    let identityToken = String(data: identityTokenData, encoding: .utf8)!
                    let newUser = UserFromLoginProvider(loginProvider: .apple, providerId: identityToken, name: name, email: email)
                    userTrigger.send(newUser)
                }
            default:
                break
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

// TODO: 컬러 가이드 세팅되면 컬러, 폰트 적용
// MARK: Kakao Login
extension LoginView {
    
    private var kakaoLoginButton: some View {
        ZStack {
            Color.black
            Button(action: {
                authenticateWithKakaoTalk()
            }, label: {
                HStack {
                    WardAssets.Image.kakaoLoginLogo.swiftUIImage
                        .foregroundStyle(.black)
                    Text(WardStrings.loginWithKakao)
                        .foregroundStyle(Color.white)
                }
            })
        }
        .frame(width: 325, height: 60)
        .cornerRadius(16)
    }
    
    private func authenticateWithKakaoTalk() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print("카카오 로그인 실패 \(error)")
                    return
                }
                self.loginWithKakaoTalk()
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print("카카오 로그인 실패 \(error)")
                    return
                }
                self.loginWithKakaoTalk()
            }
        }
    }
    
    private func loginWithKakaoTalk() {
        UserApi.shared.me() { userMaybe, error in
            if let error = error {
                print("카카오 유저 정보 가져오기 실패 \(error)")
                return
            }
            
            guard
                let user = userMaybe,
                let id = user.id else {
                print("유저 정보 존재하지 않음")
                return
            }
            
            let account = user.kakaoAccount
            let profile = account?.profile
            
            let newUser = UserFromLoginProvider(loginProvider: .kakao, providerId: String(id), name: profile?.nickname, email: account?.email)
            userTrigger.send(newUser)
        }
    }
}
