//
//  LoginPlatform.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI

enum LoginPlatform {
    case apple, kakao
}

extension LoginPlatform {
    
    var buttonText: String {
        switch self {
        case .apple:
            return WardStrings.loginWithApple
        case .kakao:
            return WardStrings.loginWithKakao
        }
    }
    
    var buttonImage: Image {
        switch self {
        case .apple:
            return WardAssets.Image.appleLoginLogo.swiftUIImage
        case .kakao:
            return WardAssets.Image.kakaoLoginLogo.swiftUIImage
        }
    }
}
