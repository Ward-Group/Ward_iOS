//
//  BrandDetailViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

struct BrandDetailViewModel {
    
}

extension BrandDetailViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let currentFilterOptionTrigger: Driver<FilterOption>
        let isLikedTrigger: Driver<Void>
        
        init(currentFilterOptionTrigger: Driver<FilterOption>, isLikedTrigger: Driver<Void>) {
            self.currentFilterOptionTrigger = currentFilterOptionTrigger
            self.isLikedTrigger = isLikedTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var item =  BrandListItem(nameKo: "나이키", nameEn: "Nike1", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now)
        
        var tabs = [
            WardSegmentedControlTab(id: "item", title: WardStrings.items),
            WardSegmentedControlTab(id: "releaseInfo", title: WardStrings.releaseInfo)
        ]
        @Published var currentTab = WardSegmentedControlTab(id: "item", title: WardStrings.items)

        let filterOptions = [
            FilterOption(id: "sortByDate", title: WardStrings.sortedByPickedAt),
            FilterOption(id: "sortByDateReversed", title: WardStrings.sortedByPickedAtReversed)
        ]
        @Published var currentFilterOption = FilterOption(id: "sortByDate", title: WardStrings.sortedByPickedAt)
        @Published var items: [BrandDetailItem] = [
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900),
            BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900)
        ]
        @Published var releaseInfoList: [ReleaseItem] = [
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200),
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200),
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200),
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200),
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200),
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200),
            ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200)
        ]
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.isLikedTrigger.sink {
            output.item.isLiked.toggle()
        }
        .store(in: cancelBag)
        
        return output
    }
}
