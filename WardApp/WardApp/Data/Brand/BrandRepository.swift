//
//  BrandRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Combine

struct BrandRepository {
    
    func getBrandListOrderByRanking(page: Int) -> AnyPublisher<PagableData<[Brand]>?, Error> {
        return NetworkingManager.shared.run(BrandEndpoint.brandsOrderByRanking(page: page), type: WardPagableResponse<[Brand]>.self)
            .tryMap { response in
                switch response.code {
                case 200:
                    return response.data
                default:
                    return nil
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getBrandListOrderByKoreanAlphabet(page: Int) -> AnyPublisher<PagableData<[Brand]>?, Error> {
        return NetworkingManager.shared.run(BrandEndpoint.brandsOrderByKoreanAlphabet(page: page), type: WardPagableResponse<[Brand]>.self)
            .tryMap { response in
                switch response.code {
                case 200:
                    return response.data
                default:
                    return nil
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getBrandListOrderByAlphabet(page: Int) -> AnyPublisher<PagableData<[Brand]>?, Error> {
        return NetworkingManager.shared.run(BrandEndpoint.brandsOrderByAlphabet(page: page), type: WardPagableResponse<[Brand]>.self)
            .tryMap { response in
                Log.debug(#file, #function, response)
                switch response.code {
                case 200:
                    return response.data
                default:
                    return nil
                }
            }
            .eraseToAnyPublisher()
    }
}
