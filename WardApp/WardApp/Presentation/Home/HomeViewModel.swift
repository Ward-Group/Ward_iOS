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
    enum ReleaseCategoryTabType {
        case dueToday
        case currentlyAvailable
        case interestedItem
        case upcomingRelease
        case registeredToday
        
        var title: String {
            switch self {
            case .dueToday: // 오늘 마감
                return WardStrings.dueToday
            case .currentlyAvailable: // 발매 중
                return WardStrings.currentlyAvailable
            case .upcomingRelease:
                return WardStrings.upcomingRelease
            case .registeredToday: // 오늘 등록
                return WardStrings.registeredToday
            case .interestedItem: // 관심 상품
                return WardStrings.interestedItem
            }
        }
        
        func tabModel() -> CategoryTabModel {
            return CategoryTabModel(title: title)
        }
    }
    
    let releaseCategoryTabList: [ReleaseCategoryTabType] = [.dueToday,
                                                            .currentlyAvailable,
                                                            .interestedItem,
                                                            .upcomingRelease,
                                                            .registeredToday]
}

extension HomeViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
        @Published var bannerPages: [BannerPageModel] = []
        @Published var releaseCategoryTabs: [CategoryTabModel] = []
        @Published var selectedReleaseTabModel: CategoryTabModel? = nil
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        // -- Output -- //
        let output = Output()
        
        // -- Data -- //
        let expiringProducts = PassthroughSubject<[ExpiringProduct], Never>()
        expiringProducts
            .map { $0.map { $0.toModel() } }
            .assign(to: \.bannerPages, on: output)
            .store(in: cancelBag)
        
        let selectedReleaseTabModel = PassthroughSubject<CategoryTabModel?, Never>()
        let releaseCategoryTabs = PassthroughSubject<[CategoryTabModel], Never>()
        selectedReleaseTabModel
            .assign(to: \.selectedReleaseTabModel, on: output)
            .store(in: cancelBag)
        releaseCategoryTabs
            .assign(to: \.releaseCategoryTabs, on: output)
            .store(in: cancelBag)
        
        // -- Input -- //
        input.loadTrigger
            .sink(receiveValue: {
                expiringProducts.send(getExpiringProducts())
                
                let getReleaseCategoryTabs = getReleaseCategoryTabs()
                releaseCategoryTabs.send(getReleaseCategoryTabs)
                selectedReleaseTabModel.send(getReleaseCategoryTabs[0])
            })
            .store(in: cancelBag)
        
        return output
    }
}

// MARK: - Logic
extension HomeViewModel {
    private func getReleaseCategoryTabs() -> [CategoryTabModel] {
        return releaseCategoryTabList
            .enumerated()
            .map { return $0.element.tabModel() }
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

// MARK: - 임시 데이터 모델
struct ExpiringProduct: Identifiable {
    let id = UUID()
    let image: Image
    
    func toModel() -> BannerPageModel {
        return BannerPageModel(id: id, image: image)
    }
}

struct ProgressProduct: Identifiable {
    let id = UUID()
    let site: String
    let date: String
    let time: String
}
