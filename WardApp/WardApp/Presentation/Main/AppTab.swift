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
    
    var title: String {
        switch self {
        case .category:
            return  WardStrings.categoryTabbar
        case .release:
            return  WardStrings.releaseTabbar
        case .home:
            return  WardStrings.homeTabbar
        case .interested:
            return  WardStrings.interestedTabbar
        case .mypage:
            return  WardStrings.myPageTabbar
        }
    }
    
    var icon: Image {
        switch self {
        case .category:
            return WardAssets.Image.Tab.category.swiftUIImage
        case .release:
            return WardAssets.Image.Tab.release.swiftUIImage
        case .home:
            return WardAssets.Image.Tab.home.swiftUIImage
        case .interested:
            return WardAssets.Image.Tab.interested.swiftUIImage
        case .mypage:
            return WardAssets.Image.Tab.mypage.swiftUIImage
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
