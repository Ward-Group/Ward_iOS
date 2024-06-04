//
//  SearchUsecase.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import Foundation
import Combine

struct SearchUsecase {
    let service: SearchHistoryService
}

extension SearchUsecase {
    
    func addHistory(_ term: String) {
        service.addHistory(term)
    }
    
    func removeHistory(_ id: UUID) {
        service.removeHistory(id)
    }
    
    func removeAll() {
        service.removeAll()
    }
}
