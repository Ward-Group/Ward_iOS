//
//  LoginView.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                background
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        WardAssets.Image.wardLogo.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: 54)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        LoginButton(loginPlatform: .kakao)
                            .padding()
                        LoginButton(loginPlatform: .apple)
                        Spacer()
                        Text(WardStrings.yetMember)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                            .foregroundStyle(WardAssets.Color.footnoteText.swiftUIColor)
                            .padding()
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
}

#Preview {
    LoginView()
}
