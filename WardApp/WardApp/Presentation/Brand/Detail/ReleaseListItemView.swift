//
//  BrandDetailListItemView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI

struct ReleaseListItemView: View {
    
    let geo: GeometryProxy
    let item: ReleaseItem
    
    var body: some View {
        let imageSize = geo.size.width * 0.2
        
        ZStack {
            Color.background
            
            HStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color.gray2)
                    .frame(width: imageSize, height: imageSize)
                
                VStack(alignment: .leading) {
                    Text(item.siteName)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                        .foregroundStyle(Color.black3)
                    
                    Text(item.name)
                        .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 18))
                        .foregroundStyle(Color.black5)
                    
                    Text(String(item.timeLeft))
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                        .foregroundStyle(Color.mainBlue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    GeometryReader { geo in
        ReleaseListItemView(geo: geo, item: ReleaseItem(siteName: "ABC 마트", name: "아식스 젤 카야노", timeLeft: 7200))
    }
}
