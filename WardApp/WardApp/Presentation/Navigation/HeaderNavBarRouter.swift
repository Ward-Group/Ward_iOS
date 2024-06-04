//
//  HeaderNavBarRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/2/24.
//

import SwiftUI

class HeaderNavBarRouter: ObservableObject {
    
    @Published var fullScreenSheet: FullScreenSheet?
    
    enum FullScreenSheet: String, Identifiable {
        case notification
        
        var id: String {
            self.rawValue
        }
    }
    
    func present(fullScreenSheet: FullScreenSheet) {
        self.fullScreenSheet = fullScreenSheet
    }
    
    func dismissFullScreenSheet() {
        self.fullScreenSheet = nil
    }
    
    @ViewBuilder
    func build(fullScreenSheet: FullScreenSheet) -> some View {
        switch fullScreenSheet {
        case .notification:
            let view: NotificationView = NotificationAssemblerImpl().resolve()
            view
        }
    }
}
