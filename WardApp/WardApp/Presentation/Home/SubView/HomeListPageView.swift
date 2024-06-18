//
//  HomeListPageView.swift
//  WardApp
//
//  Created by suni on 6/4/24.
//

import SwiftUI

struct HomeListPageView: View {
    var body: some View {
        itemList
    }
}

extension HomeListPageView {
    private var itemList: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                
            }
        }
        
    }
}

#Preview {
    HomeListPageView()
}
