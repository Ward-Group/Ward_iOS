//
//  HeaderNavBarView.swift
//  WardApp
//
//  Created by suni on 5/18/24.
//

import SwiftUI

struct HeaderNavBarView: View {
    @State var showSearching: Bool
    @State var showNotification: Bool
    
    var body: some View {
        HStack {
            WardAssets.Image.wardLogo.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(height: 24)
            Spacer()
            if showSearching {
                Button(action: {}, label: {
                    WardAssets.Image.Icon.searching.swiftUIImage
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
            if showNotification {
                Spacer()
                    .frame(width: 8)
                Button(action: {}, label: {
                    WardAssets.Image.Icon.notification.swiftUIImage
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
        }
        .padding(16)
        .background(WardAssets.Color.backgroundColor.swiftUIColor)
    }
}
