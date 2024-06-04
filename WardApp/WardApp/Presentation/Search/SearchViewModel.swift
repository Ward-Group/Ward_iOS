//
//  SearchViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import SwiftUI

struct SearchViewModel {
    let useCase: SearchUsecase
}

extension SearchViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let searchTextTrigger: Driver<String>
        let searchBarFocusTrigger: Driver<Bool>
        let removeAllTabTrigger: Driver<Void>
        let xMarkButtonTappedTrigger: Driver<UUID>
        let searchButtonTrigger: Driver<Void>
        
        init(searchTextTrigger: Driver<String>, searchBarFocusTrigger: Driver<Bool>, removeAllTabTrigger: Driver<Void>, xMarkButtonTappedTrigger: Driver<UUID>, searchButtonTrigger: Driver<Void>) {
            self.searchTextTrigger = searchTextTrigger
            self.searchBarFocusTrigger = searchBarFocusTrigger
            self.removeAllTabTrigger = removeAllTabTrigger
            self.xMarkButtonTappedTrigger = xMarkButtonTappedTrigger
            self.searchButtonTrigger = searchButtonTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var searchText = ""
        @Published var searchBarFocused = false
        @Published var searchHistory: [SearchHistory] = []
        @Published var searchResultItems: [SearchResultItem] = []
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        useCase.service.$history
            .map { $0.sorted(by: { $0.createdAt > $1.createdAt })}
            .assign(to: \.searchHistory, on: output)
            .store(in: cancelBag)
        
        input.removeAllTabTrigger
            .sink {
                useCase.removeAll()
            }
            .store(in: cancelBag)
        
        input.xMarkButtonTappedTrigger
            .sink { id in
                useCase.removeHistory(id)
            }
            .store(in: cancelBag)
        
        input.searchTextTrigger
            .assign(to: \.searchText, on: output)
            .store(in: cancelBag)
        
        input.searchBarFocusTrigger
            .assign(to: \.searchBarFocused, on: output)
            .store(in: cancelBag)
        
        input.searchButtonTrigger
        // TODO: API 연동 시 두 번째 파라미터를 검색 단어로 이용
            .sink {
                let searchText = output.searchText.trimmingCharacters(in: .whitespaces)
                if !searchText.isEmpty {
                    output.searchBarFocused = false
                    useCase.addHistory(searchText)
                    output.searchResultItems = [
                        SearchResultItem(brand: "나이키", name: "조던 로우 1", retailer: "ABC 마트", hits: 100),
                        SearchResultItem(brand: "나이키", name: "조던 로우 1", retailer: "ABC 마트", hits: 100),
                        SearchResultItem(brand: "나이키", name: "조던 로우 1", retailer: "ABC 마트", hits: 100),
                        SearchResultItem(brand: "나이키", name: "조던 로우 1", retailer: "ABC 마트", hits: 100),
                        SearchResultItem(brand: "나이키", name: "조던 로우 1", retailer: "ABC 마트", hits: 100)
                    ]
                }
            }
            .store(in: cancelBag)
        
        return output
    }
}
