//
//  ReleaseUsecase.swift
//  WardApp
//
//  Created by peppermint100 on 5/15/24.
//

import Foundation
import Combine

struct ReleaseUseCase {
    let repository: ReleaseRepository
}

extension ReleaseUseCase {
    
    func getReleaseInfos(category: ItemCategory, sort: ItemSortOption, page: Int) -> AnyPublisher<[ReleasedItem], Never> {
        return repository.fetchReleaseInfos(category: category, sort: sort, page: page)
    }
}
