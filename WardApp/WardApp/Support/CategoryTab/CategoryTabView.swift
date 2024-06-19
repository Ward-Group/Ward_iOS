//
//  CategoryTabView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct CategoryTabView: View {
    
    @Binding var models: [CategoryTabModel]
    @Binding var selectedModel: CategoryTabModel?
    
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 6) {
                ForEach(models, id: \.id) { model in
                    // TODO: Id로 구분
                    let isSelected = (model.title == selectedModel?.title)
                    roundTextView(model.title, isSelected: isSelected)
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func roundTextView(_ text: String, isSelected: Bool) -> some View {
        return Text(text)
            .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
            .frame(height: 32)
            .padding(.horizontal, 10)
            .foregroundColor(Color.white)
            .background(isSelected ? Color.mainBlue : Color.blue2)
            .cornerRadius(16)
    }
}

struct CategoryTabView_Previews: PreviewProvider {
    @State static var models: [CategoryTabModel] = [CategoryTabModel(title: "오늘 마감"),
                                                    CategoryTabModel(title: "발매 중"),
                                                    CategoryTabModel(title: "관심 상품"),
                                                    CategoryTabModel(title: "발매 확장"),
                                                    CategoryTabModel(title: "오늘 등록")]
    @State static var selectedModel: CategoryTabModel? = CategoryTabModel(title: "오늘 마감")
    
    static var previews: some View {
        CategoryTabView(models: $models, selectedModel: $selectedModel)
    }
}
