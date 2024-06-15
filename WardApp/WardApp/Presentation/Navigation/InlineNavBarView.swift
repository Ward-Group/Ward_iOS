//
//  InlineNavBarView.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import SwiftUI
import Combine

struct InlineNavBarView: View {
    
    let title: String
    let buttonsRight: [NavigationBarButton]
    let buttonsLeft: [NavigationBarButton]
    
    init(title: String, buttonsRight: [NavigationBarButton] = [], buttonsLeft: [NavigationBarButton] = []) {
        self.title = title
        self.buttonsRight = buttonsRight
        self.buttonsLeft = buttonsLeft
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.background
                
                HStack {
                    HStack(spacing: 5) {
                        ForEach(buttonsRight) { button in
                            button.icon
                        }
                    }
  
                    Spacer()
                    
                    HStack(spacing: 10) {
                        ForEach(buttonsLeft) { button in
                            button.icon
                                .onTapGesture {
                                    button.trigger.send()
                                }
                        }
                    }
                }
                .padding()
                
                HStack {
                    Spacer()
                    Text(title)
                        .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 20))
                    Spacer()
                }
            }
        }
        .frame(maxHeight: 45, alignment: .top)
    }
}

#Preview {
    let right: [NavigationBarButton] = [
        NavigationBarButton(style: .back, trigger: PassthroughSubject<Void, Never>())
    ]
    
    let left: [NavigationBarButton] = [
        NavigationBarButton(style: .search, trigger: PassthroughSubject<Void, Never>()),
        NavigationBarButton(style: .notification, trigger: PassthroughSubject<Void, Never>())
    ]
    
    return InlineNavBarView(
        title: "공지사항",
        buttonsRight: right,
        buttonsLeft: left
    )
}
