//
//  TestView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI

struct HeaderNavTestView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderNavBarView(showSearching: true, showNotification: true)
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }

    }
}

#Preview {
    HeaderNavTestView()
}
