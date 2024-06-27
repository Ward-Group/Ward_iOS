//
//  CategoryRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

class CategoryRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    enum Page: Hashable {
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        Text("Page")
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
