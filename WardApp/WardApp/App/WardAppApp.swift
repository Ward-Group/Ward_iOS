//
//  WardAppApp.swift
//  WardApp
//
//  Created by peppermint100 on 5/1/24.
//

import SwiftUI
import ComposableArchitecture
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct WardAppApp: App {
    
    init() {
        let appKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_APP_KEY")
        KakaoSDK.initSDK(appKey: appKey as! String)
    }
    
    static let loginStore = Store(initialState: LoginFeature.State()) {
        LoginFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            SignUpView()
//            LoginView(store: WardAppApp.loginStore)
//                .onOpenURL(perform: { url in
//                    if AuthApi.isKakaoTalkLoginUrl(url) {
//                        AuthController.handleOpenUrl(url: url)
//                    }
//                })
        }
    }
}
