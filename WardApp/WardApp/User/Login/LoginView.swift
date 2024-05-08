//
//  LoginView.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI
import ComposableArchitecture
import AuthenticationServices

struct LoginView: View {
    
    let store: StoreOf<LoginFeature>
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    background
                    VStack(alignment: .center) {
                        Spacer()
                        Spacer()
                        WardAssets.Image.wardLogo.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.7)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        kakaoLoginButton
                            .padding()
                        appleLoginButton
                        Spacer()
                    }
                    .toolbar(.hidden)
                }
            }
        }
    }
}

private extension LoginView {
    
    var background: some View {
        WardAssets.Color.backgroundColor.swiftUIColor
            .ignoresSafeArea(edges: .top)
    }
    
    var kakaoLoginButton: some View {
        LoginButton(loginPlatform: .kakao)
            .onTapGesture {
                store.send(.kakaoLoginButtonTapped)
            }
    }
    
    var appleLoginButton: some View {
        SignInWithAppleButton(
            onRequest: { request in store.send(.appleLoginOnRequest(request))},
            onCompletion: { result in store.send(.appleLoginOnComplete(result))}
        )
        .loginButtonStyle()
        .overlay {
            LoginButton(loginPlatform: .apple)
                .allowsHitTesting(false)
        }
        
    }
}

#Preview {
    LoginView(
        store: Store(initialState: LoginFeature.State()) {
            LoginFeature()
        }
    )
}
