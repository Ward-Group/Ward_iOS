//
//  CategoryTabViewModel.swift
//  WardApp
//
//  Created by suni on 5/31/24.
//

import Foundation

struct CategoryTabViewModel: Identifiable {
    let id = UUID()
    let title: String
    var isSelect: Bool
}
