////
////  HomeProductHorizontalView.swift
////  WardApp
////
////  Created by suni on 6/4/24.
////
//
//import SwiftUI
//
//struct HomeProductHorizontalView: View {
//    
//    let model: BaseProductModel
//    
//    var body: some View {
//        ZStack {
//            Color.background
//            if model.time.isEmpty {
//                withRankView
//            } else {
//                withRemaingTimeView
//            }
//        }
//    }
//}
//
//extension HomeProductHorizontalView {
//    
//    private var withRemaingTimeView: some View {
//        HStack(spacing: 0) {
//            imagePlaceHolder
//                .frame(width: 72, height: 72)
//                .padding(.leading, 16)
//                .padding(.trailing, 12)
//            VStack(alignment: .leading, spacing: 4) {
//                Text(model.site)
//                    .foregroundStyle(Color.black3)
//                    .lineLimit(1)
//                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
//                Text(model.product)
//                    .foregroundStyle(Color.black6)
//                    .lineLimit(1)
//                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
//                Text(model.time)
//                    .foregroundStyle(Color.mainRed)
//                    .lineLimit(1)
//                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
//            }
//            Spacer()
//            Text("응모")
//                .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
//                .frame(height: 34)
//                .padding(.horizontal, 10)
//                .foregroundColor(Color.white)
//                .background(Color.mainBlue)
//                .cornerRadius(16)
//                .padding(.trailing, 16)
//        }
//    }
//    
//    private var withRankView: some View {
//        HStack(spacing: 0) {
//            Text(model.rank)
//                .foregroundStyle(Color.black6)
//                .lineLimit(1)
//                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
//                .padding(.leading, 26)
//                .padding(.trailing, 14)
//            imagePlaceHolder
//                .frame(width: 72, height: 72)
//                .padding(.trailing, 14)
//            VStack(alignment: .leading, spacing: 4) {
//                Text(model.brand)
//                    .foregroundStyle(Color.black3)
//                    .lineLimit(1)
//                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
//                Text(model.product)
//                    .foregroundStyle(Color.black6)
//                    .lineLimit(1)
//                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
//            }
//            Spacer()
//            WardAssets.Image.Icon.likeNo.swiftUIImage
//                .padding(20)
//        }
//    }
//    
//    private var imagePlaceHolder: some View {
//        RoundedRectangle(cornerRadius: 8)
//            .foregroundStyle(Color.mainGray)
//    }
//}
//
//#Preview {
//    HomeProductHorizontalView(
//        model: BaseProductModel(
//            site: "사이트명",
//            rank: "01",
//            product: "상품명",
//            brand: "브랜드명",
//            time: "남은 시간"
//        )
//    )
//}
