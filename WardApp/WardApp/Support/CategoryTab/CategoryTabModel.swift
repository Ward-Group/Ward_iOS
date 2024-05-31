//
//  CategoryTabModel.swift
//  WardApp
//
//  Created by suni on 5/31/24.
//

import Foundation

struct CategoryTabModel: Identifiable {
    let id = UUID()
    let title: String
    var isSelect: Bool
}

enum ReleaseCategoryTab {
    case dueToday
    case currentlyAvailable
    case interestedItem
    case confirmedRelease
    case registeredToday
    
    var title: String {
        switch self {
        case .dueToday: 
            return WardStrings.dueToday
        case .currentlyAvailable: 
            return WardStrings.currentlyAvailable
        case .confirmedRelease:
            return WardStrings.confirmedRelease
        case .registeredToday:
            return WardStrings.registeredToday
        case .interestedItem:
            return WardStrings.interestedItem
        }
    }
    
    func model(_ isSelect: Bool = false) -> CategoryTabModel {
        return CategoryTabModel(title: title, isSelect: isSelect)
    }
}
