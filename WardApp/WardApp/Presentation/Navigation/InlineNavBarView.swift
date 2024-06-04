//
//  InlineNavBarView.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import SwiftUI

struct InlineNavBarView: View {
    
    let title: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.background
                
                Image(systemName: "arrow.left")
                    .frame(maxWidth: geo.size.width, alignment: .leading)
                    .padding(.leading)
                
                HStack {
                    Spacer()
                    //TODO: Search 머지되면 그 안에 있는 ArrowLeft 에셋으로 변경
                    Text(title)
                        .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 20))
                    Spacer()
                }
                .padding()
            }
        }
        .frame(maxHeight: 45, alignment: .top)
    }
}

#Preview {
    InlineNavBarView(title: "공지사항")
}
