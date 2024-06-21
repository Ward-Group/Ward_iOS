//
//  MyPageViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import Foundation

struct MyPageViewModel {
    
}

extension MyPageViewModel: ViewModel {
    
    final class Input: ObservableObject {
        
    }
    
    final class Output: ObservableObject {
        
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        return output
    }
}
