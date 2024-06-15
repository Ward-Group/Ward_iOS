//
//  User.swift
//  WardApp
//
//  Created by peppermint100 on 5/15/24.
//

import Foundation

struct UserFromLoginProvider {
    let loginProvider: LoginProvider
    let providerId: String
    let name: String?
    let email: String
    let appPushNotification: Bool? = false
}
