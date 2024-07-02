//
//  ReleasedItemListView.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import SwiftUI

struct ReleasedItemListView: View {
    
    let geo: GeometryProxy
    let item: ReleasedItem
    
    var body: some View {
        let imageSize = geo.size.width * 0.2
        ZStack {
            Color.background
            
            HStack {
                image
                    .frame(width: imageSize, height: imageSize)
                    .padding(.trailing, 7)
                textList
                Spacer()
                button
            }
        }
    }
}

#Preview {
    GeometryReader { geo in
        ReleasedItemListView(geo: geo, item: PreviewMockData.releasedItems.first!)
            .padding()
    }
}

extension ReleasedItemListView {
    var image: some View {
        AsyncImage(
            url: URL(string: item.itemMainImage),
            content: { image in
                image
                    .resizable()
            }, placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color.mainGray)
            }
        )
    }
    
    var textList: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.platformKoreanName)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.black3)
            
            Text(item.itemKoreanName)
                .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 18))
                .foregroundStyle(Color.black5)
            
            // TODO: 남은 시간 계산하도록 Extension에 기작성된 메소드이용
            Text(item.dueDate)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.mainRed)
        }
    }
    
    var button: some View {
        Text(item.releaseMethod.description)
            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
            .foregroundStyle(Color.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background {
                Capsule()
                    .cornerRadius(70)
                    .foregroundStyle(Color.mainBlue)
            }
    }
}
