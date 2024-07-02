//
//  WardCircularSegmentedControl.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import SwiftUI

struct WardCircularSegmentedControl: View {
    
    var tabs: [WardSegmentedControlTab]
    @Binding var selectedTab: WardSegmentedControlTab
    
    init(tabs: [WardSegmentedControlTab], currentTab: Binding<WardSegmentedControlTab>) {
        self.tabs = tabs
        self._selectedTab = currentTab
    }
    
    var body: some View {
        ZStack {
            Color.background
            HStack(spacing: 10) {
                ForEach(tabs, id: \.id) { tab in
                    Text(tab.title)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background {
                            Capsule()
                                .cornerRadius(70)
                                .foregroundStyle(
                                    tab == selectedTab ? Color.mainBlue : Color.mainGray2
                                )
                        }
                        .fixedSize()
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
            }
        }
    }
}

#Preview {
    let merchant = WardSegmentedControlTab(id: "merchant", title: "관심 상품")
    let brand = WardSegmentedControlTab(id: "brandm", title: "관심 브랜드")
    return WardCircularSegmentedControl(tabs: [merchant, brand], currentTab: .constant(merchant))
}
