//
//  LoginButton.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI

struct LoginButton: View {
    
    var loginPlatform: LoginPlatform

    var body: some View {
        Button {
            
        } label: {
            ZStack {
                buttonBackground
                HStack {
                    loginPlatform.buttonImage
                    Text(loginPlatform.buttonText)
                        .foregroundStyle(.white)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 16))
                }
            }
            .cornerRadius(16)
            .frame(width: 325, height: 60)
        }
    }
}

#Preview {
    LoginButton(loginPlatform: .apple)
        .frame(width: 325, height: 60)
}

private extension LoginButton {
    
    var buttonBackground: some View {
        WardAssets.Color.accentColor.swiftUIColor
    }
}
