//
//  CancelBag.swift
//  WardApp
//
//  Created by suni on 5/18/24.
//

import Combine

/**
 # (C) CancelBag
 - Authors: suni
 - Note: Combine cancel 관리를 위한 공통 class
 */
open class CancelBag {
    public var cancellables = Set<AnyCancellable>()
    
    public func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}

extension AnyCancellable {
    public func store(in cancelBag: CancelBag) {
        cancelBag.cancellables.insert(self)
    }
}
