//
//  NotificationItem.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import Foundation

struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let createdAt: Date
    let isNew: Bool
}
