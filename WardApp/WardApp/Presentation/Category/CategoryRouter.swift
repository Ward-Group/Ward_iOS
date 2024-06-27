//
//  CategoryRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

class CategoryRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    private let brandAssembler = BrandAssembler()
    
    enum Page: Hashable {
        case brand
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .brand:
            brandAssembler.view()
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
