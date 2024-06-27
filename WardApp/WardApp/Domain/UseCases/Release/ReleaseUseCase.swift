//
//  ReleaseUsecase.swift
//  WardApp
//
//  Created by peppermint100 on 5/15/24.
//

import Foundation
import Combine

struct ReleaseUseCase {
    let repository: ReleaseRepository
}

extension ReleaseUseCase {
    
    func getReleasedDueToday() -> AnyPublisher<[ReleaseItem], Error>{
        return repository.fetchReleasesDueToday()
    }
}
