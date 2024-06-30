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
    
    @ViewBuilder
    func detailView(brand: Brand) -> some View {
        BrandDetailView(vm: resolve(brand: brand))
    }
    
    func resolve(brand: Brand) -> BrandDetailViewModel {
        return BrandDetailViewModel(brand: brand)
    }
    
    func resolve() -> BrandListViewModel {
        return BrandListViewModel(brandUseCase: resolve())
    }
    
    func resolve() -> BrandUseCase {
        return BrandUseCase(repository: resolve())
    }
    
    func resolve() -> BrandRepository {
        return BrandRepository()
    }
}
