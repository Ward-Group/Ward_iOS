//
//  SectionHeaderView.swift
//  WardApp
//
//  Created by peppermint100 on 6/24/24.
//

import SwiftUI

struct SectionHeaderView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
            .foregroundStyle(Color.black1)
            .padding(.bottom, 15)
    }
}

#Preview {
    SectionHeaderView(title: "나의 활동")
}
