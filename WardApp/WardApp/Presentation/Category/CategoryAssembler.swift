//
//  CategoryAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

class CategoryAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let router = CategoryRouter()
        CategoryView(vm: resolve())
            .environmentObject(router)
    }
    
    func resolve() -> CategoryViewModel {
        return CategoryViewModel()
    }
}
