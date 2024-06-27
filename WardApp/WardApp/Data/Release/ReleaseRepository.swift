//
//  ReleaseRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Foundation
import Combine

struct ReleaseRepository {
    
    func fetchReleasesDueToday() -> AnyPublisher<[ReleaseItem], Error> {
        return NetworkingManager.shared.run(ReleaseEndpoint.dueToday, type: WardBaseResponse<[ReleaseItem]>.self)
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
            .eraseToAnyPublisher()
    }
}
