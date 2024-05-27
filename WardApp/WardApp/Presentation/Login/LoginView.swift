//
//  LoginView.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI
import Combine
import AuthenticationServices

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
        VStack {
            appleLoginButton
        }
    }
}

// TODO: Color Guide, 폰트 설정 세팅되면 색상, 폰트 설정 변경
// MARK: Apple Login
extension LoginView {
    var appleLoginButton: some View {
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
                let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)!
                let newUser = UserFromLoginProvider(loginProvider: .apple, providerId: identityToken, name: name, email: email)
                userTrigger.send(newUser)
            default:
                break
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

#Preview {
    let vm: LoginViewModel = LoginAssemblerImpl().resolve()
    return LoginView(vm: vm)
}
