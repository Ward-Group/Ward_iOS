//
//  SectionTabView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct SectionTabViewModel: Identifiable {
    var id: UUID = UUID()
    let title: String
}

struct SectionTabView: View {
    
    @Binding var models: [SectionTabViewModel]
    @Binding var selectedModel: SectionTabViewModel?
    
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
    @State static var models: [SectionTabViewModel] = [SectionTabViewModel(title: "오늘 마감"),
                                                        SectionTabViewModel(title: "발매 중"),
                                                        SectionTabViewModel(title: "관심 상품"),
                                                        SectionTabViewModel(title: "발매 확장"),
                                                        SectionTabViewModel(title: "오늘 등록")]
    @State static var selectedModel: SectionTabViewModel? = SectionTabViewModel(title: "오늘 마감")
    
    static var previews: some View {
        SectionTabView(models: $models, selectedModel: $selectedModel)
    }
}
