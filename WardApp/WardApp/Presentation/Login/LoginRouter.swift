//
//  LoginRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/6/24.
//

import SwiftUI

class LoginRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    enum Page {
        case signUp
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .signUp:
            SignUpView()
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
}
