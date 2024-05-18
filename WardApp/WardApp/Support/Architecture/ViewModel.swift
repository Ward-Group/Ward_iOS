//
//  ViewModel.swift
//  WardApp
//
//  Created by suni on 5/18/24.
//

import Combine

/**
 # (P) ViewModel
 - Authors: suni
 - Note:ViewModel Input-Output transform 구조 Protocol
 */
public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output
}
