//
//  BrandFilterOption.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Foundation

enum BrandFilterOption: String, Identifiable {
    case ranking, koreanAlphabet, alphabet
    
    var id: String {
        self.rawValue
    }
    
    var filterOption: FilterOption {
        switch self {
        case .ranking:
            FilterOption(id: "orderByRanking", title: WardStrings.orderByRanking)
        case .koreanAlphabet:
            FilterOption(id: "orderByKoreanAlphabet", title: WardStrings.orderByKoreanAlphabet)
        case .alphabet:
            FilterOption(id: "orderByAlphabet", title: WardStrings.orderByAlphabet)
        }
    }
}
