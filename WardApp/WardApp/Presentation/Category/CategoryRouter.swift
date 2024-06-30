//
//  CategoryRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

class CategoryRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    let brandAssembler = BrandAssembler()
    
    enum Page: Hashable {
        case brand
        case brandDetail(Brand)
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
        }
        
        static func == (lhs: Page, rhs: Page) -> Bool {
            switch (lhs, rhs) {
            case let (.brandDetail(lhsItem), .brandDetail(rhsItem)):
                return lhsItem.brandId == rhsItem.brandId
            default:
                return true
            }
        }
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .brand:
            brandAssembler.view()
                .environmentObject(self)
        case .brandDetail(let brand):
            brandAssembler.detailView(brand: brand)
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
