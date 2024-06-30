//
//  BrandListViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

struct BrandListViewModel {
    let brandUseCase: BrandUseCase
}

extension BrandListViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let loadTrigger: Driver<Void>
        let currentFilterOptionTrigger: Driver<BrandFilterOption>
        let loadMoreBrandsTrigger: Driver<Int>
        
        init(loadTrigger: Driver<Void>, currentFilterOptionTrigger: Driver<BrandFilterOption>, loadMoreBrandsTrigger: Driver<Int>) {
            self.loadTrigger = loadTrigger
            self.currentFilterOptionTrigger = currentFilterOptionTrigger
            self.loadMoreBrandsTrigger = loadMoreBrandsTrigger
        }
    }
    
    final class Output: ObservableObject {
        let filterOptions = [
            BrandFilterOption.ranking,
            BrandFilterOption.koreanAlphabet,
            BrandFilterOption.alphabet
        ]
        @Published var currentFilterOption = BrandFilterOption.ranking
        @Published var brands: [Brand] = []
        @Published var isLoadingMoreBrands = false
        @Published var pageInfo = PageInfo()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.loadTrigger
            .sink {
                getBrands(output: output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        
        input.currentFilterOptionTrigger
            .sink { option in
                output.currentFilterOption = option
                getBrands(output: output, cancelBag: cancelBag)
            }
            .store(in: cancelBag)
        
        input.loadMoreBrandsTrigger
            .sink { idx in
                if idx == output.brands.count && output.brands.count < output.pageInfo.totalElements {
                    output.isLoadingMoreBrands = true
                    loadMoreBrands(output: output, cancelBag: cancelBag)
                }
            }
            .store(in: cancelBag)
        
        return output
    }
    
    func loadMoreBrands(output: Output, cancelBag: CancelBag) {
        brandUseCase.getBrandList(by: output.currentFilterOption, page: output.pageInfo.page + 1)
            .sink { completion in
                switch completion {
                case .finished:
                    output.isLoadingMoreBrands = false
                case .failure:
                    output.isLoadingMoreBrands = false
                }
            } receiveValue: { pagableData in
                Log.debug(#file, #function, "brands", pagableData)
                if let pagableData {
                    output.brands.append(contentsOf: pagableData.data)
                    output.pageInfo = pagableData.pageInfo
                }
            }
            .store(in: cancelBag)
    }
    
    func getBrands(output: Output, cancelBag: CancelBag) {
        brandUseCase.getBrandList(by: output.currentFilterOption, page: 1)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            } receiveValue: { pagableData in
                if let pagableData {
                    output.brands = pagableData.data
                    output.pageInfo = pagableData.pageInfo
                }
            }
            .store(in: cancelBag)
    }
}
