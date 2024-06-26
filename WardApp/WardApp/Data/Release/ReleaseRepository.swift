//
//  ReleaseRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Foundation
import Combine

struct ReleaseRepository {
    
    func fetchReleasesDueToday(accessToken: String) -> AnyPublisher<[ReleaseItem], Error> {
        return NetworkingManager.shared.run(ReleaseEndpoint.dueToday(accessToken: accessToken), type: WardBaseResponse<[ReleaseItem]>.self)
            .tryMap { response in
                let code = response.code
                switch code {
                case 200:
                    return response.data ?? []
                default:
                    Log.debug(#file, #function, "Response Code가 200이 아닙니다 \(response)")
                    return []
                }
            }
            .eraseToAnyPublisher()
    }
}
