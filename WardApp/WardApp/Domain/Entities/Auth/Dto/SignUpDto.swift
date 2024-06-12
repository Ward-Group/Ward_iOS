//
//  SignUpDto.swift
//  WardApp
//
//  Created by peppermint100 on 6/9/24.
//

import Foundation

struct SignUpDto: Codable {
    let provider: LoginProvider
    let providerId: String
    let name: String
    let email: String
    let nickname: String
    let emailNotification: Bool
    let snsNotification: Bool
    let appPushNotification: Bool
}
