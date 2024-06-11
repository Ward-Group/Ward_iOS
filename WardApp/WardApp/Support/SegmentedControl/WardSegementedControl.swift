//
//  WardSegementedControl.swift
//  WardApp
//
//  Created by peppermint100 on 5/29/24.
//

import SwiftUI

struct WardSegementedControl: View {
    
    var tabs: [WardSegmentedControlTab]
    @Binding var selectedTab: WardSegmentedControlTab
    
    @State var tabIndicatorOffset: CGFloat = 0
    
    let active: Color
    let inactive: Color
    let font: SwiftUI.Font
    
    init(
        tabs: [WardSegmentedControlTab], currentTab: Binding<WardSegmentedControlTab>,
        active: Color = .mainBlue, inactive: Color = .black3, font: SwiftUI.Font = WardFonts.Pretendard.semiBold.swiftUIFont(size: 20)
    ) {
        self.tabs = tabs
        self._selectedTab = currentTab
        self.active = active
        self.inactive = inactive
        self.font = font
    }
    
    var body: some View {
        ZStack {
            Color.background
            GeometryReader { geo in
                let tabWidth = geo.size.width / CGFloat(tabs.count)
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        ForEach(tabs, id: \.id) { tab in
                            VStack {
                                Text(tab.title)
                                    .foregroundStyle(
                                        selectedTab == tab ? active : inactive
                                    )
                                    .font(font)
                            }
                            .frame(width: tabWidth)
                            .onTapGesture {
                                selectedTab = tab
                                let index = tabs.firstIndex { $0 == selectedTab }
                                withAnimation(.bouncy) {
                                    tabIndicatorOffset = CGFloat(index ?? 0) * tabWidth
                                }
                            }
                        }
                    }
                    Rectangle()
                        .foregroundStyle(Color.mainBlue)
                        .frame(width: tabWidth, height: 2)
                        .offset(x: tabIndicatorOffset)
                }
            }
        }
    }
}

#Preview {
    let merchant = WardSegmentedControlTab(id: "merchant", title: "관심 상품")
    let brand = WardSegmentedControlTab(id: "brandm", title: "관심 브랜드")
    return WardSegementedControl(tabs: [merchant, brand], currentTab: .constant(merchant), active: Color.mainBlue, inactive: Color.black3)
}
