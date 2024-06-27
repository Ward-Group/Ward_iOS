//
//  CategoryRowView.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

struct CategoryRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.black3)
                .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 18))
            
            Spacer()
            
            WardAssets.Image.Icon.chevronRight.swiftUIImage
        }
        .frame(height: 70)
    }
}

#Preview {
    ZStack {
        Color.mainGray
        VStack {
            CategoryRowView(title: "상품")
                .frame(height: 70)
            CategoryRowView(title: "상품")
                .frame(height: 70)
            CategoryRowView(title: "상품")
                .frame(height: 70)
            
        }
        .padding()
    }
}
