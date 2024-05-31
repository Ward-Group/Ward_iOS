//
//  Driver.swift
//  WardApp
//
//  Created by suni on 5/31/24.
//

import Combine
import Foundation

/**
 # (typealias) Driver
 - Authors: suni
 - Note: AnyPublisher<T, Never> 타입 지정 / Failure Never이기 때문에 UI Update에 적합
 */
public typealias Driver<T> = AnyPublisher<T, Never>

extension Publisher {
    
    /// Publisher -> Driver<T> 로 래핑 /  UI Update에 적합하도록 RunLoop.main을 사용
    public func asDriver() -> Driver<Output> {
        return self.catch { _ in Empty() }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    public static func just(_ output: Output) -> Driver<Output> {
        return Just(output).eraseToAnyPublisher()
    }
    
    public static func empty() -> Driver<Output> {
        return Empty().eraseToAnyPublisher()
    }
}
