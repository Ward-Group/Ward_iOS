//
//  ItemsRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Combine

struct ItemRepository {
    
    func fetchItems(category: ItemCategory, sort: ItemSortOption, page: Int) -> AnyPublisher<[Item], Never> {
        return NetworkingManager.shared.run(ItemEndpoint.items(category: category, sort: sort, page: page), type: WardBaseResponse<[Item]>.self)
            .tryMap { response in
                Log.debug(#file, #function, "response = \(response)")
                let code = response.code
                switch code {
                case 200:
                    return response.data ?? []
                default:
                    return []
                }
            }
            .catch { _ in Just([]) }
            .eraseToAnyPublisher()
    }
}
