//
//  SettingAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/24/24.
//

import SwiftUI

final class SettingAssembler {
    
    @ViewBuilder
    func view() -> some View {
        SettingView(vm: resolve())
    }
    
    func resolve() -> SettingViewModel {
        return SettingViewModel()
    }
}
