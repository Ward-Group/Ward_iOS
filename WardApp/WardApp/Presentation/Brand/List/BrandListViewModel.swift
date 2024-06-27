//
//  BrandListViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

struct BrandListViewModel {
}

extension BrandListViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let loadTrigger: Driver<Void>
        let currentFilterOptionTrigger: Driver<FilterOption>
        let isLikedTrigger: Driver<BrandListItem>
        
        init(loadTrigger: Driver<Void>, currentFilterOptionTrigger: Driver<FilterOption>, isLikedTrigger: Driver<BrandListItem>) {
            self.loadTrigger = loadTrigger
            self.currentFilterOptionTrigger = currentFilterOptionTrigger
            self.isLikedTrigger = isLikedTrigger
        }
    }
    
    final class Output: ObservableObject {
        let filterOptions = [
            FilterOption(id: "orderByRanking", title: WardStrings.orderByRanking),
            FilterOption(id: "orderByKoreanAlphabet", title: WardStrings.orderByKoreanAlphabet),
            FilterOption(id: "orderByAlphabet", title: WardStrings.orderByAlphabet)
        ]
        @Published var currentFilterOption = FilterOption(id: "orderByRanking", title: WardStrings.orderByRanking)
        @Published var items: [BrandListItem] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.loadTrigger
            .sink {
                output.items = getItems()
            }
            .store(in: cancelBag)
        
        input.currentFilterOptionTrigger
            .sink { option in
                output.currentFilterOption = option
            }
            .store(in: cancelBag)
        
        input.isLikedTrigger
            .map { $0.nameEn }
            .sink { itemName in
                if let index = output.items.firstIndex(where: { $0.nameEn == itemName }) {
                    output.items[index].isLiked.toggle()
                }
            }
            .store(in: cancelBag)
        
        return output
    }
    
    func getItems() -> [BrandListItem] {
        return [
            BrandListItem(nameKo: "나이키", nameEn: "Nike1", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now),
            BrandListItem(nameKo: "나이키", nameEn: "Nike2", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now),
            BrandListItem(nameKo: "나이키", nameEn: "Nike3", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now),
            BrandListItem(nameKo: "나이키", nameEn: "Nike4", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now),
            BrandListItem(nameKo: "나이키", nameEn: "Nike5", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now),
            BrandListItem(nameKo: "나이키", nameEn: "Nike6", imageUrls: ["0", "1", "2", "3", "4"], isLiked: true, createdAt: Date.now)
        ]
    }
}
