//
//  Publisher.swift
//  WardApp
//
//  Created by peppermint100 on 5/27/24.
//

import Combine

extension Publisher {
    public func sink() -> AnyCancellable {
        return self.sink(receiveCompletion: { _ in }, receiveValue: { _ in })
    }
}
