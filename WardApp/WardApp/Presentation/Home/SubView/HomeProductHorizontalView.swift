//
//  HomeProductHorizontalView.swift
//  WardApp
//
//  Created by suni on 6/4/24.
//

import SwiftUI

struct HomeProductHorizontalModel: Identifiable {
    enum ProductType {
        case withRemainingTime
        case withRank
    }
    let productType: ProductType
    let id: UUID
    let site: String
    let product: String
    let time: String
}

struct HomeProductHorizontalView: View {
    
    let model: HomeProductHorizontalModel
    
    var body: some View {
        ZStack {
            Color.background
            withRemaingTimeView
        }
    }
}

extension HomeProductHorizontalView {
    
    private var withRemaingTimeView: some View {
        HStack {
            imagePlaceHolder
                .frame(width: 72, height: 72)
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 4) {
                siteName
                productName
                time
            }
            Spacer()
            roundTextView
                .padding(.trailing, 16)
        }
    }
    
    private var imagePlaceHolder: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.mainGray)
    }
    
    private var siteName: some View {
        Text(model.site)
            .foregroundStyle(Color.black6)
            .lineLimit(1)
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
    }
    
    private var productName: some View {
        Text(model.product)
            .foregroundStyle(Color.black6)
            .lineLimit(1)
            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
    }
    
    private var time: some View {
        Text(model.time)
            .foregroundStyle(Color.mainRed)
            .lineLimit(1)
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
    }
    
    private var roundTextView: some View {
        return Text("응모")
            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
            .frame(height: 34)
            .padding(.horizontal, 10)
            .foregroundColor(Color.white)
            .background(Color.mainBlue)
            .cornerRadius(16)
    }
}

#Preview {
    HomeProductHorizontalView(model: HomeProductHorizontalModel(productType: .withRemainingTime,
                                                                id: UUID(), 
                                                                site: "사이트명",
                                                                product: "상품명",
                                                                time: "남은 시간"))
}
