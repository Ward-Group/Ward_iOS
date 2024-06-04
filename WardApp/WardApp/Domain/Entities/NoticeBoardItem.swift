//
//  NoticeBoardItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import Foundation

struct NoticeBoardItem {
    let id = UUID()
    let title: String
    let content: String
    let createdAt: Date
    var isCollapsed: Bool = false
}
