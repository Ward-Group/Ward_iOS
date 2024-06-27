//
//  ItemsRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Combine

struct ItemRepository {
    
    func fetchItemsReleaseNow() -> AnyPublisher<[Item], Error> {
        return NetworkingManager.shared.run(ItemEndpoint.releaseNow, type: WardBaseResponse<[Item]>.self)
            .tryMap { response in
                Log.debug(#file, #function, "response = \(response)")
                switch response.code {
                case 200:
                    return response.data ?? []
                default:
                    return []
                }
            }
            .eraseToAnyPublisher()
    }
}
