//
//  ItemUseCases.swift
//  WardApp
//
//  Created by peppermint100 on 5/15/24.
//

import Combine

struct ItemUseCase {
    let repository: ItemRepository
}

extension ItemUseCase {
    
    func getItems(category: ItemCategory, sort: ItemSortOption, page: Int) -> AnyPublisher<[Item], Never> {
        return repository.fetchItems(category: category, sort: sort, page: page)
    }
}
