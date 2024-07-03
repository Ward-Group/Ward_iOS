//
//  ReleaseViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import Foundation

struct ReleaseViewModel {
    let releaseUseCase: ReleaseUseCase
    let itemUseCase: ItemUseCase
}

// TODO: Infinite Scroll Paging 추가
extension ReleaseViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let loadTrigger: Driver<Void>
        
        init(loadTrigger: Driver<Void>) {
            self.loadTrigger = loadTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var category: ItemCategory = .all
        @Published var sortOption: ItemSortOption = .dueToday
        
        var categories: [ItemCategory] = [.all, .footwear, .clothing]
        var sortOptions: [ItemSortOption] = [.dueToday, .releaseNow, .releaseConfirm, .registerToday]
        
        @Published var categoryTab = WardSegmentedControlTab(id: ItemCategory.all.rawValue, title: ItemCategory.all.title)
        @Published var sortOptionTab = WardSegmentedControlTab(id: ItemSortOption.dueToday.rawValue, title: ItemSortOption.dueToday.title)
        
        @Published var isFetching = true
        
        @Published var releasedItems = [ReleasedItem]()
        @Published var items = [Item]()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.loadTrigger
            .sink {
                addSubscribers(input, output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        
        return output
    }
    
    func addSubscribers(_ input: Input, _ output: Output, cancelBag: CancelBag) {
        output.$category.combineLatest(output.$sortOption)
            .sink { _, _ in
                output.isFetching = true
            }
            .store(in: cancelBag)
        
        output.$category.combineLatest(output.$sortOption)
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .sink { category, sort in
                switch sort {
                case .dueToday, .releaseNow:
                    releaseUseCase.getReleaseInfos(category: category, sort: sort, page: 1)
                        .sink { releasedItems in
                            output.releasedItems = releasedItems
                        }
                        .store(in: cancelBag)
                case .releaseConfirm, .registerToday:
                    itemUseCase.getItems(category: category, sort: sort, page: 1)
                        .sink { items in
                            output.items = items
                        }
                        .store(in: cancelBag)
                }
                output.isFetching = false
            }
            .store(in: cancelBag)
        
        output.$categoryTab.sink {
            output.category = ItemCategory(rawValue: $0.id) ?? .all
        }
        .store(in: cancelBag)
        
        output.$sortOptionTab.sink {
            output.sortOption = ItemSortOption(rawValue: $0.id) ?? .dueToday
        }
        .store(in: cancelBag)
    }
}
