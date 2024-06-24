//
//  MyPageRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import SwiftUI

class MyPageRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    enum Page {
        case noticeBoard
        case setting
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .noticeBoard:
            NoticeBoardAssembler().view()
                .environmentObject(self)
        case .setting:
            SettingAssembler().view()
                .environmentObject(self)
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
