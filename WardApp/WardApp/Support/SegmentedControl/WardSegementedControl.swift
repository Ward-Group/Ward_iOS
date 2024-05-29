//
//  WardSegementedControl.swift
//  WardApp
//
//  Created by peppermint100 on 5/29/24.
//

import SwiftUI

struct WardSegementedControl: View {
    
    @Binding var tabs: [WardSegmentedControlTab]
    
    @State var selectedTab: WardSegmentedControlTab?
    @State var tabIndicatorOffset: CGFloat = 0
    
    init(tabs: Binding<[WardSegmentedControlTab]>) {
        self._tabs = tabs
        if let firstTab = tabs.wrappedValue.first {
            _selectedTab = State(initialValue: firstTab)
        }
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
                                        selectedTab == tab ? Color.mainBlue : Color.black3
                                    )
                                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 20))
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
    return WardSegementedControl(tabs: .constant([merchant, brand]))
}
