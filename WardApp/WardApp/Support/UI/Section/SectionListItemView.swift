//
//  SectionListItemView.swift
//  WardApp
//
//  Created by peppermint100 on 6/24/24.
//

import SwiftUI

struct SectionListItemView: View {
    
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
                    .foregroundStyle(Color.black5)
                
                Spacer()
                
                WardAssets.Image.Icon.chevronRight.swiftUIImage
            }
            .padding(.bottom, 5)
            
            Divider()
        }
        .contentShape(Rectangle())
        .padding(.bottom, 10)
    }
}

#Preview {
    SectionListItemView(title: "공지사항")
}
