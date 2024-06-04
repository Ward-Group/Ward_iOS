//
//  ProgressProductItemRowView.swift
//  WardApp
//
//  Created by suni on 6/4/24.
//

import SwiftUI

struct ProgressProductItemModel: Identifiable {
    let id = UUID()
    let site: String
    let date: String
    let time: String
}

struct ProgressProductItemRowView: View {
    
    let item: ProgressProductItemModel
    
    var body: some View {
        ZStack {
            Color.background
            HStack {
                    imagePlaceHolder
                        .frame(width: 72, height: 72)
                        .padding(.leading, 12)
                    VStack(alignment: .leading, spacing: 4) {
                        siteName
                        date
                        time
                    }
                    Spacer()
                    roundTextView
                }
        }
    }
}

extension ProgressProductItemRowView {
    
    private var imagePlaceHolder: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.mainGray)
    }
    
    private var siteName: some View {
        Text(item.site)
            .foregroundStyle(Color.black6)
            .lineLimit(1)
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
    }
    
    private var date: some View {
        Text(item.date)
            .foregroundStyle(Color.black6)
            .lineLimit(1)
            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
    }
    
    private var time: some View {
        Text(item.time)
            .foregroundStyle(Color.mainRed)
            .lineLimit(1)
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
    }
    
    private var roundTextView: some View {
        return Text("진행중")
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
            .frame(height: 34)
            .padding(.horizontal, 10)
            .foregroundColor(Color.white)
            .background(Color.mainBlue)
            .cornerRadius(16)
    }
}

#Preview {
    ProgressProductItemRowView(item:
                                ProgressProductItemModel(site: "사이트명",
                                                date: "12월 28일(목) 00:00 마감",
                                                time: "남은 시간"))
}
