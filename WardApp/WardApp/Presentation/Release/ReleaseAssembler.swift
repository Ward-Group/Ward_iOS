//
//  ReleaseAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import SwiftUI

class ReleaseAssembler {
    
    @ViewBuilder
    func view() -> some View {
        ReleaseView(vm: resolve())
    }
    
    func resolve() -> ReleaseViewModel {
        return ReleaseViewModel()
    }
}
