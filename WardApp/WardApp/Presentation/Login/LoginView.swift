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
            userTrigger: userTrigger.asDriver()
        )
        output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack {
                    logo
                        .padding(.top, geo.size.height * 0.15)
                        .padding(.bottom, geo.size.height * 0.5)
                    kakaoLoginButton
                        .frame(width: geo.size.width * 0.86, height: geo.size.height * 0.08)
                    appleLoginButton
                        .frame(width: geo.size.width * 0.86, height: geo.size.height * 0.08)
                        .padding(.top, 5)
                }
            }
        }
    }
}

#Preview {
    let vm: LoginViewModel = LoginAssemblerImpl().resolve()
    return LoginView(vm: vm)
}

extension LoginView {
    
    private var logo: some View {
        WardAssets.Image.wardLogo.swiftUIImage
            .resizable()
            .frame(width: 244, height: 54)
    }
}

// MARK: Apple Login
extension LoginView {
    private var appleLoginButton: some View {
        SignInWithAppleButton(
            onRequest: appleLoginOnRequest,
            onCompletion: appleLoginOnCompletion
        )
        .cornerRadius(16)
        .overlay {
            ZStack {
                Color.mainBlue
                HStack {
                    WardAssets.Image.appleLoginLogo.swiftUIImage
                        .foregroundStyle(Color.black0)
                    Text(WardStrings.loginWithApple)
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 16))
                        .foregroundStyle(WardAssets.Color.white0.swiftUIColor)
                }
            }
            .cornerRadius(16)
            .allowsHitTesting(false)
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

// MARK: Kakao Login
extension LoginView {
    
    private var kakaoLoginButton: some View {
        ZStack {
            Color.mainBlue
            Button(action: {
                authenticateWithKakaoTalk()
            }, label: {
                HStack {
                    WardAssets.Image.kakaoLoginLogo.swiftUIImage
                    Text(WardStrings.loginWithKakao)
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 16))
                        .foregroundStyle(WardAssets.Color.white0.swiftUIColor)
                }
            })
        }
        .cornerRadius(16)
    }
    
    private func authenticateWithKakaoTalk() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { _, error in
                if let error = error {
                    print("카카오 로그인 실패 \(error)")
                    return
                }
                self.loginWithKakaoTalk()
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { _, error in
                if let error = error {
                    print("카카오 로그인 실패 \(error)")
                    return
                }
                self.loginWithKakaoTalk()
            }
        }
    }
    
    private func loginWithKakaoTalk() {
        UserApi.shared.me { userMaybe, error in
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
