//
//  HomeRepository.swift
//  WardApp
//
//  Created by suni on 7/10/24.
//

import Combine

struct HomeRepository {
    
    func fetchReleaseInfos(section: String) -> AnyPublisher<[ReleasedItem], Never> {
        return NetworkingManager.shared.run(HomeEndPoint.releaseInfos(section: section), type: WardBaseResponse<[ReleasedItem]>.self)
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
