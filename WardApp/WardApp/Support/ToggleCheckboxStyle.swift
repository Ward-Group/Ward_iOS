//
//  ToggleCheckboxStyle.swift
//  WardApp
//
//  Created by peppermint100 on 5/8/24.
//

import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Symbols.checkmarkSquare
                .symbolVariant(.fill)
                .font(.system(size: 24))
        }
    }
}
