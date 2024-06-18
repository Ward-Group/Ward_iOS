//
//  SearchViewAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import SwiftUI


class SearchViewAssembler {

    @ViewBuilder
    func view() -> some View {
        let vm: SearchViewModel = resolve()
        SearchView(vm: vm)
    }
    
    func resolve() -> SearchViewModel {
        return SearchViewModel(useCase: resolve())
    }
    
    func resolve() -> SearchUsecase {
        return SearchUsecase(service: resolve())
    }
    
    func resolve() -> SearchHistoryService {
        return SearchHistoryService()
    }
}
