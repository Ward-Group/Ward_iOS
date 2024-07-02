//
//  ReleaseMethod.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import Foundation

enum ReleaseMethod: String, Codable {
    case fcfs
    case entry
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)

        switch rawValue {
        case "선착순":
            self = .fcfs
        case "응모":
            self = .entry
        default:
            self = .unknown
        }
    }
    
    var description: String {
        switch self {
        case .fcfs:
            WardStrings.fcfs
        case .entry:
            WardStrings.entry
        case .unknown:
            ""
        }
    }
}
