//
//  MainRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/6/24.
//

import SwiftUI

class MainRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var fullScreenSheet: FullScreenSheet?
    
    enum FullScreenSheet: String, Identifiable {
        case login
        
        var id: String {
            self.rawValue
        }
    }
    
    @ViewBuilder
    func build(fullScreenSheet: FullScreenSheet) -> some View {
        switch fullScreenSheet {
        case .login:
            LoginAssembler().view()
        }
    }
    
    func present(fullScreenSheet: FullScreenSheet) {
        self.fullScreenSheet = fullScreenSheet
    }
}
