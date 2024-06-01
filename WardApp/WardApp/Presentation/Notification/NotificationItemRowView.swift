//
//  NotificationItemRowView.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import SwiftUI

struct NotificationItemRowView: View {
    
    let item: NotificationItem
    var body: some View {
        GeometryReader { geo in
            let imageSize = geo.size.width * 0.21
            HStack(alignment: .center) {
                image
                    .frame(width: imageSize, height: imageSize)
                VStack(alignment: .leading) {
                    HStack {
                        subtitle
                        Spacer().frame(width: geo.size.width * 0.15)
                        newIndicator
                        Spacer()
                        createdAt
                    }
                    title
                }
            }
        }
    }
}

extension NotificationItemRowView {
    
    private var image: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.gray2)
    }
    
    // TODO: 디자이너가 폰트 지정해주면 변경
    private var subtitle: some View {
        Text(item.subtitle)
            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
            .foregroundStyle(Color.black5)
            .lineLimit(1)
    }
    
    private var title: some View {
        Text(item.title)
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
            .foregroundStyle(Color.black5)
            .lineLimit(2)
    }
    
    private var newIndicator: some View {
        Text(WardStrings.new)
            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
            .foregroundStyle(Color.mainBlue)
    }
    
    private var createdAt: some View {
        Text(Date.now.formatDateDifference(from: item.createdAt))
            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
            .foregroundStyle(Color.darkGray)
    }
}

#Preview {
    NotificationItemRowView(
        item: NotificationItem(
            title: "마뗑킴 잡화라인 오픈", subtitle: "마뗑킴 잡화라인 오픈",
            createdAt: Date.now.addingTimeInterval(-36000), isNew: true)
    )
}
