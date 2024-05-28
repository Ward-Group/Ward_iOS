//
//  HomeView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            BannerView()
            .frame(maxWidth: .infinity)
        }
    }
}

extension HomeView {
}

#Preview {
    HomeView()
}
