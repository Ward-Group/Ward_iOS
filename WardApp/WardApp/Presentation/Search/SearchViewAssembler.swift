//
//  SearchViewAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import Foundation

protocol SearchViewAssembler {
    func resolve() -> SearchView
    func resolve() -> SearchViewModel
    func resolve() -> SearchUsecase
    func resolve() -> SearchHistoryService
}

class SearchViewAssemblerImpl: NotificationAssembler {
}

extension NotificationAssembler {
    func resolve() -> SearchView {
        return SearchView(vm: resolve())
    }
}

extension NotificationAssembler {
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
