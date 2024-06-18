//
//  SegmentedControlTab.swift
//  WardApp
//
//  Created by peppermint100 on 5/29/24.
//

import Foundation

struct WardSegmentedControlTab: Equatable {
    var id: String
    var title: String
    
    static func == (lhs: WardSegmentedControlTab, rhs: WardSegmentedControlTab) -> Bool {
        return lhs.id == rhs.id
    }
    
    func isEqual(to id: String) -> Bool {
        return self.id == id
    }
}
