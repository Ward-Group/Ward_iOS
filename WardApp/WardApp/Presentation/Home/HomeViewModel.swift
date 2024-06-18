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
    // TODO: navigator, usecase 연결
    //    let navigator:
    //    let useCase:
    
    let releaseCategoryTabList: [ReleaseCategoryTab] = [.dueToday,
                                                        .currentlyAvailable,
                                                        .interestedItem,
                                                        .confirmedRelease,
                                                        .registeredToday]
}

extension HomeViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
        @Published var bannerPageList: [BannerPageModel] = []
        @Published var releaseCategoryList: [CategoryTabModel] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        // -- Output -- //
        let output = Output()
        
        // -- Data -- //
        let expiringProducts = PassthroughSubject<[ExpiringProduct], Never>()
        expiringProducts
            .map { $0.map(BannerPageModel.init) }
            .assign(to: \.bannerPageList, on: output)
            .store(in: cancelBag)
        
        var indexOfSelectedReleaseTab: Int = 0
        let releaseCategoryTabs = PassthroughSubject<[CategoryTabModel], Never>()
        releaseCategoryTabs
            .assign(to: \.releaseCategoryList, on: output)
            .store(in: cancelBag)
        
        // -- Input -- //
        input.loadTrigger
            .sink(receiveValue: {
                expiringProducts.send(getExpiringProducts())
                
                indexOfSelectedReleaseTab = 0
                releaseCategoryTabs.send(getReleaseCategoryTabs(indexOfSelectedReleaseTab))
            })
            .store(in: cancelBag)
        
        return output
    }
}

// MARK: - Logic
extension HomeViewModel {
    private func getReleaseCategoryTabs(_ indexOfSelectedTab: Int) -> [CategoryTabModel] {
        return releaseCategoryTabList
            .enumerated()
            .map { return $0.element.model(indexOfSelectedTab == $0.offset) }
    }
}

// MARK: - Networking
extension HomeViewModel {
    private func getExpiringProducts() -> [ExpiringProduct] {
        return [ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage),
                ExpiringProduct(image: WardAssets.Image.homeBanner.swiftUIImage)]
    }
}

// MARK: - 임시 네트워크 모델
struct ExpiringProduct: Identifiable {
    let id = UUID()
    let image: Image
}

struct ProgressProduct: Identifiable {
    let id = UUID()
    let site: String
    let date: String
    let time: String
}
