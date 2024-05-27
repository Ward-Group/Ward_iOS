//
//  LoginView.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    var body: some View {
        VStack {
            appleLoginButton
        }
    }
}

// TODO: Color Guide, 폰트 설정 세팅되면 색상, 폰트 설정 변경
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
                onRequest: {
                    request in
                },
                onCompletion: { result in
                })
            .blendMode(.overlay)
        }
    }
}

#Preview {
    LoginView()
}
