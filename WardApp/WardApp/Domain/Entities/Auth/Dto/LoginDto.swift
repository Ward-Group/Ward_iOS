//
//  LoginDto.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation

struct LoginDto: Codable {
    let provider: LoginProvider
    let providerId: String
}
