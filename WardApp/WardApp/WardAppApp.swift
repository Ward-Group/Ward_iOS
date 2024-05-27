//
//  WardAppApp.swift
//  WardApp
//
//  Created by peppermint100 on 5/1/24.
//

import SwiftUI

@main
struct WardAppApp: App {
    
    let loginAssembler = LoginAssemblerImpl()
    
    var body: some Scene {
        WindowGroup {
            LoginView(vm: loginAssembler.resolve())
        }
    }
}
