//
//  HomeView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        bannerTitle()
    }
}

extension HomeView {
    private func bannerTitle() -> some View {
        return VStack(alignment: .leading, content: {
            Text(WardStrings.deadlineImminent).titleStyle()
            Spacer()
                .frame(height: 9)
            Text(WardStrings.enjoyTheLittleLuckYouHaveLeft)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(WardAssets.Color.placeholderGray.swiftUIColor)
        })
    }
}

#Preview {
    HomeView()
}
