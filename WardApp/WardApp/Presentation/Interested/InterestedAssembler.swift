//
//  InterestedAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 5/30/24.
//

import SwiftUI

class InterestedAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let vm: InterestedViewModel = resolve()
        InterestedView(vm: vm)
    }
    
    private func resolve() -> InterestedView {
        return InterestedView(vm: resolve())
    }
    
    private func resolve() -> InterestedViewModel {
        return InterestedViewModel()
    }
    
    func resolve() -> InterestedRouter {
        return InterestedRouter()
    }
}

