//
//  LoginRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/6/24.
//

import SwiftUI

class LoginRouter: ObservableObject {
    
    @Published var path = [Page]()
    
    enum Page: Hashable {
        
        case signUp(UserFromLoginProvider)
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
        }
        
        static func == (lhs: Page, rhs: Page) -> Bool {
            switch (lhs, rhs) {
            case let (.signUp(user1), .signUp(user2)):
                return user1.email == user2.email
            }
        }
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .signUp:
            SignUpView(router: self)
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
