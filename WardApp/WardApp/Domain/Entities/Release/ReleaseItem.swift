//
//  ReleaseItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

// TODO: ReleasedItem으로 대체 할 것
struct ReleaseItem: Codable, Identifiable {
    var id = UUID()
    let siteName: String
    let name: String
    let timeLeft: TimeInterval
}
