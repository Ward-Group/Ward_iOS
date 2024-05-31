//
//  CategoryTabView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct CategoryTabView: View {
    
    let list: [CategoryTabModel]
    
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 6) {
                ForEach(list) { category in
                    roundTextView(category.title, isSelect: category.isSelect)
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func roundTextView(_ text: String, isSelect: Bool) -> some View {
        return Text(text)
            .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
            .frame(height: 32)
            .padding(.horizontal, 10)
            .foregroundColor(Color.white)
            .background(isSelect ? Color.mainBlue : Color.blue2)
            .cornerRadius(16)
    }
}

#Preview {
    CategoryTabView(list: [CategoryTabModel(title: "오늘 마감", isSelect: true),
                           CategoryTabModel(title: "발매 중", isSelect: false),
                           CategoryTabModel(title: "관심 상품", isSelect: false),
                           CategoryTabModel(title: "발매 확장", isSelect: false),
                           CategoryTabModel(title: "오늘 등록", isSelect: false)])
}
