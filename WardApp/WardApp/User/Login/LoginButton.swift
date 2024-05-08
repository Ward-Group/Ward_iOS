//
//  LoginButton.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI

struct LoginButton: View {
    
    var loginPlatform: LoginProvider
    
    var body: some View {
        ZStack {
            buttonBackground
            HStack {
                loginPlatform.buttonImage
                Text(loginPlatform.buttonText)
                    .foregroundStyle(.white)
                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 16))
            }
        }
        .loginButtonStyle()
    }
}

#Preview {
    LoginButton(loginPlatform: .apple)
        .loginButtonStyle()
}

private extension LoginButton {
    
    var buttonBackground: some View {
        WardAssets.Color.accentColor.swiftUIColor
    }
}
