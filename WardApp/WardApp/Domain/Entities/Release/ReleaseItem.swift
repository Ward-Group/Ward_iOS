//
//  ReleaseItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

struct ReleaseItem: Codable, Identifiable {
    var id = UUID()
    let siteName: String
    let name: String
    let timeLeft: TimeInterval
}
