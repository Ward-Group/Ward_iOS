//
//  WardAppApp.swift
//  WardApp
//
//  Created by peppermint100 on 5/1/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct WardAppApp: App {
    
    init() {
        let appKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_APP_KEY") as! String
        print(appKey)
        KakaoSDK.initSDK(appKey: appKey)
    }
    
    let loginAssembler = LoginAssemblerImpl()
    let interestedAssembler = InterestedAssemblerImpl()
    let notificationAssembler = NotificationAssemblerImpl()
    
    var body: some Scene {
        WindowGroup {
            NotificationView(vm: notificationAssembler.resolve())
//            LoginView(vm: loginAssembler.resolve())
//                .onOpenURL { url in
//                    if AuthApi.isKakaoTalkLoginUrl(url) {
//                        _ = AuthController.handleOpenUrl(url: url)
//                    }
//                }
        }
    }
}
