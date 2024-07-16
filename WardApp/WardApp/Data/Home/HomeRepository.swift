//
//  HomeRepository.swift
//  WardApp
//
//  Created by suni on 7/10/24.
//

import Combine

struct HomeRepository {
    
    func fetchReleaseInfos(section: ReleaseSection) -> AnyPublisher<[HomeReleaseItem], Never> {
        return NetworkingManager.shared.run(HomeEndPoint.releaseInfos(section: section.apiKey), type: WardBaseResponse<[HomeReleaseItem]>.self)
            .tryMap { response in
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
