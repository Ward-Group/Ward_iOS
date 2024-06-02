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
    
    @StateObject private var router = HeaderNavBarRouter()
    
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
                Button(action: {
                    router.present(fullScreenSheet: .notification)
                }, label: {
                    WardAssets.Image.Icon.notification.swiftUIImage
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
        }
        .fullScreenCover(item: $router.fullScreenSheet) { fullScreenSheet in
            router.build(fullScreenSheet: fullScreenSheet)
        }
        .padding(.horizontal, 16)
        .background(WardAssets.Color.backgroundColor.swiftUIColor)
        .frame(height: 54)
        
    }
}

struct HeaderNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            HeaderNavBarView(showSearching: true, showNotification: true)
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
