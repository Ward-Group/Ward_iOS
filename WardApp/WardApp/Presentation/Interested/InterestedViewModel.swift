//
//  InterestedViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 5/30/24.
//

import Combine

struct InterestedViewModel: ViewModel {
    
    final class Input: ObservableObject {
        var currentTabTrigger: Driver<WardSegmentedControlTab>
        var currentFilterOptionTrigger: Driver<FilterOption>
        
        init(currentTabTrigger: Driver<WardSegmentedControlTab>, currentFilterOptionTrigger: Driver<FilterOption>) {
            self.currentTabTrigger = currentTabTrigger
            self.currentFilterOptionTrigger = currentFilterOptionTrigger
        }
    }
    
    final class Output: ObservableObject {
        let tabs: [WardSegmentedControlTab] = [
            WardSegmentedControlTab(id: "item", title: WardStrings.interestedItem),
            WardSegmentedControlTab(id: "brand", title: WardStrings.interestedBrand)
        ]
        
        var filterOptions = [
            FilterOption(id: "sortByDate", title: WardStrings.sortedByPickedAt),
            FilterOption(id: "sortByDateReversed", title: WardStrings.sortedByPickedAtReversed)
        ]
        
        @Published var currentTab = WardSegmentedControlTab(id: "item", title: WardStrings.interestedItem)
        @Published var currentFilterOption = FilterOption(id: "sortByDate", title: WardStrings.sortedByPickedAt)
        @Published var items: [InterestedItem] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        output.items = getItems()
        
        input.currentTabTrigger
            .assign(to: \.currentTab, on: output)
            .store(in: cancelBag)
        
        input.currentFilterOptionTrigger
            .assign(to: \.currentFilterOption, on: output)
            .store(in: cancelBag)
        
        return output
    }
    
    private func getItems() -> [InterestedItem] {
        return [
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0000"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0001"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0002"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0003"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0004"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0005"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0006"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0007"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0008"
            ),
            InterestedItem(
                brand: "나이키", name: "조던 로우 1",
                price: 139000, isLiked: true,
                status: "0000-0009"
            )
        ]
    }
}
