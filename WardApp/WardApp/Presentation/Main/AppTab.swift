//
//  AppTab.swift
//  WardApp
//
//  Created by peppermint100 on 6/1/24.
//

import SwiftUI

enum AppTab: Int, CaseIterable, Identifiable {
    case category
    case release
    case home
    case interested
    case mypage
    
    var id: Int {
        self.rawValue
    }
}

extension AppTab {
    
    var item: TabbarItem {
        switch self {
        case .category:
            TabbarItem(label: WardStrings.categoryTabbar, icon: WardAssets.Image.Tab.category.swiftUIImage)
        case .release:
            TabbarItem(label: WardStrings.releaseTabbar, icon: WardAssets.Image.Tab.release.swiftUIImage)
        case .home:
            TabbarItem(label: WardStrings.homeTabbar, icon: WardAssets.Image.Tab.home.swiftUIImage)
        case .interested:
            TabbarItem(label: WardStrings.interestedTabbar, icon: WardAssets.Image.Tab.interested.swiftUIImage)
        case .mypage:
            TabbarItem(label: WardStrings.myPageTabbar, icon: WardAssets.Image.Tab.mypage.swiftUIImage)
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .category:
            CategoryAssembler().view()
        case .release:
            ReleaseAssembler().view()
        case .home:
            HomeAssembler().view()
        case .interested:
            InterestedAssembler().view()
        case .mypage:
            MyPageAssembler().view()
        }
    }
}
