//
//  ReleaseSection.swift
//  WardApp
//
//  Created by suni on 7/11/24.
//

import Foundation

// TODO: - 발매 상품 Entity 병합 필요

enum ReleaseSection: String {
    case dueToday = "due-today"
    case releaseNow = "release-now"
    case releaseWish = "release-wish"
    case releaseSchedule = "release-schedule"
    case releaseToday = "release-today"
    case closed = "closed"
   
    var title: String {
        switch self {
        case .dueToday:
            return WardStrings.dueToday
        case .releaseNow:
            return WardStrings.releaseNow
        case .releaseWish:
            return WardStrings.releaseWish
        case .releaseSchedule:
            return WardStrings.releaseSchedule
        case .releaseToday:
            return WardStrings.releaseToday
        case .closed:
            return WardStrings.closed
        }
    }
    
    var apiKey: String {
        return self.rawValue
    }
}
