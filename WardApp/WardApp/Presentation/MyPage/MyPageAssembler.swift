//
//  MyPageAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import SwiftUI

class MyPageAssembler {
    
    @ViewBuilder
    func view() -> some View {
        MyPageView(vm: resolve())
    }
    
    func resolve() -> MyPageViewModel {
        return MyPageViewModel()
    }
}
