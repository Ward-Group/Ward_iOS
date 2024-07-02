//
//  ReleaseRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Foundation
import Combine

struct ReleaseRepository {
    
    func fetchReleaseInfos(category: ItemCategory, sort: ItemSortOption, page: Int) -> AnyPublisher<[ReleasedItem], Never> {
        return NetworkingManager.shared.run(ReleaseEndpoint.releaseInfos(category: category, sort: sort, page: page), type: WardBaseResponse<[ReleasedItem]>.self)
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
