//
//  BrandAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

class BrandAssembler {
    
    @ViewBuilder
    func view() -> some View {
        BrandListView(vm: resolve())
    }
    
    func resolve() -> BrandListViewModel {
        return BrandListViewModel()
    }
}
