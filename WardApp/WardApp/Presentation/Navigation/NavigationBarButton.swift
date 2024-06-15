//
//  NavigationBarButton.swift
//  WardApp
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI
import Combine

enum NavigationBarButtonStyle: String {
    case search
    case back
    case notification
    case like
}

struct NavigationBarButton: Identifiable {
    let style: NavigationBarButtonStyle
    let trigger: PassthroughSubject<Void, Never>
    
    var id: String {
        style.rawValue
    }

    var icon: some View {
        switch self.style {
        case .search:
            WardAssets.Image.Icon.searching.swiftUIImage
        case .back:
            WardAssets.Image.Icon.arrowLeft.swiftUIImage
        case .notification:
            WardAssets.Image.Icon.notification.swiftUIImage
        case .like:
            WardAssets.Image.Icon.likeYes.swiftUIImage
        }
    }
}
