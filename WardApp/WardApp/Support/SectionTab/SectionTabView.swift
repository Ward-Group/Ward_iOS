//
//  SectionTabView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct SectionTabViewModel: Identifiable {
    let id: String
    let title: String
}

struct SectionTabView: View {
    
    @Binding var models: [SectionTabViewModel]
    @Binding var selectedModel: SectionTabViewModel?
    
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 6) {
                ForEach(models, id: \.id) { model in
                    let isSelected = (model.id == selectedModel?.id)
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
    static var sections: [ReleaseSection] = [.dueToday, .releaseNow, .releaseWish, .releaseToday, .releaseSchedule, .closed]
    @State static var models: [SectionTabViewModel] = sections.map { SectionTabViewModel(id: $0.apiKey, title: $0.title) }
    @State static var selectedModel: SectionTabViewModel? = SectionTabViewModel(id: sections[0].apiKey, title: sections[0].title)
    
    static var previews: some View {
        SectionTabView(models: $models, selectedModel: $selectedModel)
    }
}
