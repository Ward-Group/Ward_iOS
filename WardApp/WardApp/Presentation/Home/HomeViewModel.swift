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
        @Published var selectedReleaseTabModel: CategoryTabModel?
        @Published var releaseProducts: [HomeListPageModel] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        // -- Output -- //
        let output = Output()
        
        // --  Output Data Logic -- //
        let bannerProducts = PassthroughSubject<[BaseProductModel], Never>()
        bannerProducts
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
        
        let releaseProducts = PassthroughSubject<[BaseProductModel], Never>()
        releaseProducts
            .map { models in
                var returnModels: [HomeListPageModel] = []
                var tempModels: [BaseProductModel] = []
                for model in models {
                    tempModels.append(model)
                    if tempModels.count % 5 == 0 {
                        returnModels.append(HomeListPageModel(products: tempModels))
                        tempModels.removeAll()
                    }
                }
                return returnModels
            }
            .assign(to: \.releaseProducts, on: output)
            .store(in: cancelBag)
        
        // -- Input Logic -- //
        input.loadTrigger
            .sink(receiveValue: {
                bannerProducts.send(getBannerProducts())
                
                let getReleaseCategoryTabs = getReleaseCategoryTabs()
                releaseCategoryTabs.send(getReleaseCategoryTabs)
                selectedReleaseTabModel.send(getReleaseCategoryTabs[0])

                releaseProducts.send(getReleaseProducts(with: .dueToday))
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
    
    private func getReleaseProducts(with category: ReleaseCategoryTabType) -> [BaseProductModel] {
        // TODO: 카테고리에 따라 데이터 가져오기
        return getExpiringProducts()
    }
}

// MARK: - Networking
extension HomeViewModel {
    private func getBannerProducts() -> [BaseProductModel] {
        return [BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel(),
                BaseProductModel()]
    }
    
    private func getExpiringProducts() -> [BaseProductModel] {
        let dummy1 = BaseProductModel(site: "크림", product: "나이키 신발", time: "남은 시간")
        let dummy2 = BaseProductModel(site: "크림", product: "아디다스 신발", time: "남은 시간")
        let dummy3 = BaseProductModel(site: "슈프림", product: "슈프림 티셔츠", time: "남은 시간")
        let dummy4 = BaseProductModel(site: "뉴발란스", product: "뉴발란스 티셔츠", time: "남은 시간")
        let dummy5 = BaseProductModel(site: "뉴발란스", product: "뉴발란스 신발", time: "남은 시간")
        let dummyList = [dummy1, dummy2, dummy3, dummy4, dummy5, dummy5, dummy1, dummy3, dummy4, dummy2]
        return dummyList
    }
}

// MARK: - 임시 데이터 모델
struct BaseProductModel: Identifiable {
    let id = UUID()
    var site: String = ""
    var rank: String = ""
    var product: String = ""
    var brand: String = ""
    var time: String = ""
    var bigBannerImage: Image?
    var thumbnailImage: Image?
    
    func toModel() -> BannerPageModel {
        return BannerPageModel(id: id,
                               image: bigBannerImage ?? WardAssets.Image.homeBanner.swiftUIImage)
    }
}
