//
//  ReleaseSortOption.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import Foundation

/*
 - 정렬 sort = { `?` }
     - `due-today` : 오늘마감
     - `release-now` : 발매중
     - `release-confirm` : 발매확정
     - `register-today` : 오늘등록
 */

enum ItemSortOption: String {
    case dueToday = "due-today"
    case releaseNow = "release-now"
    case releaseConfirm = "release-confirm"
    case registerToday = "register-today"
    
    var title: String {
        switch self {
        case .dueToday:
            WardStrings.dueToday
        case .releaseNow:
            WardStrings.releaseNow
        case .releaseConfirm:
            WardStrings.releaseScheduled
        case .registerToday:
            WardStrings.deadline
        }
    }
}

