//
//  BrandUseCase.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Combine

struct BrandUseCase {
    let repository: BrandRepository
}

extension BrandUseCase {
    func getBrandList(by filterOption: BrandFilterOption, page: Int) -> AnyPublisher<PagableData<[Brand]>?, Error> {
        switch filterOption {
        case .ranking:
            return repository.getBrandListOrderByRanking(page: page)
        case .koreanAlphabet:
            return repository.getBrandListOrderByKoreanAlphabet(page: page)
        case .alphabet:
            return repository.getBrandListOrderByAlphabet(page: page)
        }
    }
}
