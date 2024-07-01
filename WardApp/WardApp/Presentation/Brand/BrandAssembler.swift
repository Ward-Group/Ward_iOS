//
//  BrandAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

class BrandAssembler {
    
    @ViewBuilder
    func view(router: BrandRouterType) -> some View {
        BrandListView(vm: resolve(), router: router)
    }
    
    @ViewBuilder
    func detailView(brand: Brand, router: BrandRouterType) -> some View {
        BrandDetailView(vm: resolve(brand: brand), router: router)
    }
    
    func resolve(brand: Brand) -> BrandDetailViewModel {
        return BrandDetailViewModel(brandUseCase: resolve(), brand: brand)
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
