//
//  InterestedItem.swift
//  WardApp
//
//  Created by peppermint100 on 5/29/24.
//

import Foundation

struct InterestedItem: Identifiable, Hashable {
    let brand: String
    let name: String
    let price: Int
    let isLiked: Bool
    let code: String
    
    var id: String {
        code
    }
}
