//
//  ReleaseViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import Foundation

struct ReleaseViewModel {
    
}

extension ReleaseViewModel: ViewModel {
    
    final class Input: ObservableObject {
    }
    
    final class Output: ObservableObject {
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        return output
    }
}
