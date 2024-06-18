//
//  DarkChevronDisclosureGroupStyle.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import SwiftUI

struct DarkChevronDisclosureGroupStyle<Label: View>: DisclosureGroupStyle {
    let button: Label
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.label
            Spacer()
            button.rotationEffect(.degrees(configuration.isExpanded ? 0 : -90))
                .padding()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                configuration.isExpanded.toggle()
            }
        }
        if configuration.isExpanded {
            configuration.content
                .disclosureGroupStyle(self)
        }
    }
}
