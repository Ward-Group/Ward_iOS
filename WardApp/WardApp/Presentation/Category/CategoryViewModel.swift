//
//  CategoryViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Foundation

struct CategoryViewModel {
    
}

extension CategoryViewModel: ViewModel {
    
    final class Input: ObservableObject {
        
    }
    
    final class Output: ObservableObject {
        
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        return output
    }
}
