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
    
    func getItemsReleaseNow() -> AnyPublisher<[Item], Error> {
        return repository.fetchItemsReleaseNow()
    }
}
