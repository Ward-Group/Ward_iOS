//
//  HomeUseCase.swift
//  WardApp
//
//  Created by suni on 6/18/24.
//

import Foundation
import Combine

struct HomeUseCase {
    let repository: HomeRepository
}

extension HomeUseCase {
    func getReleaseInfos(section: String) -> AnyPublisher<[ReleasedItem], Never> {
        return repository.fetchReleaseInfos(section: section)
    }
}
