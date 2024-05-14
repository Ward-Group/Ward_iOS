//
//  LoginView.swift
//  WardApp
//
//  Created by peppermint100 on 5/4/24.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    background
                    VStack(alignment: .center) {
                        WardAssets.Image.wardLogo.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.7)
                    }
                    .toolbar(.hidden)
                }
            }
        }
    }
}

private extension LoginView {
    
    var background: some View {
        WardAssets.Color.backgroundColor.swiftUIColor
            .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    LoginView()
}
