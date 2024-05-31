//
//  HomeViewModel.swift
//  WardApp
//
//  Created by suni on 5/31/24.
//

import Foundation
import Combine

struct HomeViewModel {
    // TODO: navigator, usecase 연결
//    let navigator:
//    let useCase:
}

extension HomeViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        
        let output = Output()
        
        input.loadTrigger
            .sink(receiveValue: {
                Log.todo("HomeViewModel loadTrigger")
            })
            .store(in: cancelBag)
        
        return output
    }
}
