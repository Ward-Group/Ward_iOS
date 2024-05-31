//
//  Observable.swift
//  WardApp
//
//  Created by suni on 5/31/24.
//

import Combine

/**
 # (typealias) Observable
 - Authors: suni
 - Note: AnyPublisher<T, Error> 타입 지정
 */
public typealias Observable<T> = AnyPublisher<T, Error>

extension Publisher {
    /// Publisher -> Observable<T> 로 래핑
    public func asObservable() -> Observable<Output> {
        self
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
    
    public static func just(_ output: Output) -> Observable<Output> {
        Just(output)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    public static func empty() -> Observable<Output> {
        return Empty().eraseToAnyPublisher()
    }
}
