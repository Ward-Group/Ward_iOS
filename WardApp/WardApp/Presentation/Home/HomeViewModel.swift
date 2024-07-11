//
//  HomeViewModel.swift
//  WardApp
//
//  Created by suni on 5/31/24.
//

import Foundation
import SwiftUI
import Combine

struct HomeViewModel {
    let releaseUseCase: ReleaseUseCase
    let itemUseCase: ItemUseCase
    let homeUseCase: HomeUseCase
}

extension HomeViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
        @Published var bannerPages: [BannerPageViewModel] = []
//        @Published var releaseSections: [ReleaseSection] = [.dueToday, .releaseNow, .releaseWish, .releaseSchedule, .releaseToday, .closed]
//        @Published var selectedReleaseSection: ReleaseSection = .dueToday
//        @Published var releaseItems: [HomeListPageModel] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        // Banner Items transformation
        let bannerItems = PassthroughSubject<[HomeReleaseItem], Never>()
        bannerItems
            .map { $0.map { BannerPageViewModel(id: $0.id, imageUrl: $0.itemMainImage )}}
            .assign(to: \.bannerPages, on: output)
            .store(in: cancelBag)
        
        // Release category tabs transformation
//        let selectedReleaseTabModel = PassthroughSubject<CategoryTabModel?, Never>()
//        let releaseCategoryTabs = PassthroughSubject<[CategoryTabModel], Never>()
//        selectedReleaseTabModel
//            .assign(to: \.selectedReleaseTabModel, on: output)
//            .store(in: cancelBag)
//        releaseCategoryTabs
//            .assign(to: \.releaseCategoryTabs, on: output)
//            .store(in: cancelBag)
        
        // Release products transformation
//        let releaseProducts = PassthroughSubject<[BaseProductModel], Never>()
//        releaseProducts
//            .map { models -> [HomeListPageModel] in
//                stride(from: 0, to: models.count, by: 5).map {
//                    HomeListPageModel(products: Array(models[$0..<min($0 + 5, models.count)]))
//                }
//            }
//            .assign(to: \.releaseProducts, on: output)
//            .store(in: cancelBag)
        
        // Input logic
        input.loadTrigger
            .sink(receiveValue: {
                // Fetch Banner Items
                homeUseCase.getReleaseInfos(section: .dueToday)
                    .sink { items  in
                        bannerItems.send(items)
                    }.store(in: cancelBag)
            })
            .store(in: cancelBag)
        
        return output
    }
}
