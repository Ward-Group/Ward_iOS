//
//  AppTabView.swift
//  WardApp
//
//  Created by peppermint100 on 6/1/24.
//

import SwiftUI

struct AppTabView: View {
    
    @Binding var selection: Int
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppTab.allCases) { tab in
                tab.destination
                    .tabItem {
                        Text(tab.item.label)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                        tab.item.icon
                            .renderingMode(.template)
                    }
                    .tag(tab.id)
            }
        }
        .tint(Color.mainBlue)
    }
}

#Preview {
    AppTabView(selection: .constant(2))
}
