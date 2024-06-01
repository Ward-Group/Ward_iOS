//
//  HeaderNavBarView.swift
//  WardApp
//
//  Created by suni on 5/18/24.
//

import SwiftUI
import Combine

struct HeaderNavBarView: View {
    
    var body: some View {
        HStack {
            WardAssets.Image.wardLogo.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(height: 24)
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(WardAssets.Color.backgroundColor.swiftUIColor)
        .frame(height: 54)
    }
}

struct HeaderNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            HeaderNavBarView()
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
