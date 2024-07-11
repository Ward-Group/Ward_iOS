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
        @Published var releaseSectionTabs: [SectionTabViewModel] = []
        @Published var selectedReleaseSectionTab: SectionTabViewModel?
        @Published var releaseListPages: [HomeListPageViewModel] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        // Banner Items transformation
        let bannerItems = PassthroughSubject<[HomeReleaseItem], Never>()
        bannerItems
            .map { $0.map { BannerPageViewModel(id: $0.id, imageUrl: $0.itemMainImage )}}
            .assign(to: \.bannerPages, on: output)
            .store(in: cancelBag)
        
        // Release section tabs transformation
        let releaseSections = CurrentValueSubject<[ReleaseSection], Never>(
            [.dueToday,
             .releaseNow,
             .releaseWish,
             .releaseSchedule,
             .releaseToday,
             .closed
            ]
        )
        releaseSections
            .map { $0.map { SectionTabViewModel(id: $0.apiKey, title: $0.title) }}
            .assign(to: \.releaseSectionTabs, on: output)
            .store(in: cancelBag)
        let selectedReleaseSection = CurrentValueSubject<ReleaseSection, Never>(.dueToday)
        selectedReleaseSection
            .map { SectionTabViewModel(id: $0.apiKey, title: $0.title) }
            .assign(to: \.selectedReleaseSectionTab, on: output)
            .store(in: cancelBag)
        
        // Release products transformation
        let releaseItems = PassthroughSubject<[HomeReleaseItem], Never>()
        let items = PassthroughSubject<[Item], Never>()
        releaseItems
            .map { items -> [HomeListPageViewModel] in
                stride(from: 0, to: items.count, by: 5).map {
                    HomeListPageViewModel(releaseItems: Array(items[$0..<min($0 + 5, items.count)]))
                }
            }
            .assign(to: \.releaseListPages, on: output)
            .store(in: cancelBag)
        items
            .map { items -> [HomeListPageViewModel] in
                stride(from: 0, to: items.count, by: 5).map {
                    HomeListPageViewModel(items: Array(items[$0..<min($0 + 5, items.count)]))
                }
            }
            .assign(to: \.releaseListPages, on: output)
            .store(in: cancelBag)
        
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
