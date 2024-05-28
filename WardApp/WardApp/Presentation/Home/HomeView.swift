//
//  HomeView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        bannerTitle
    }
}

extension HomeView {
    private var bannerTitle: some View {
        return VStack(alignment: .leading, content: {
            Text(WardStrings.deadlineImminent).titleStyle
            Spacer()
                .frame(height: 9)
            Text(WardStrings.enjoyTheLittleLuckYouHaveLeft)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(WardAssets.Color.placeholderGray.swiftUIColor)
        })
    }
    
    private var bannerTime: some View {
        return HStack(alignment: .center, content: {
            
        })
    }
    
    private var bannerTimeCircle: some View {
        return ZStack(alignment: .center, content: {
            Circle()
            Text("0")
        })
        .frame(width: 41, height: 41)
    }
}

#Preview {
    HomeView()
}
