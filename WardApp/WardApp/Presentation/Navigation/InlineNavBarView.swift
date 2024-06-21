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
    
    init(title: String, buttonsLeft: [NavigationBarButton] = [], buttonsRight: [NavigationBarButton] = []) {
        self.title = title
        self.buttonsLeft = buttonsLeft
        self.buttonsRight = buttonsRight
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.background
                
                HStack {
                    HStack(spacing: 5) {
                        ForEach(buttonsLeft) { button in
                            Button(action: {
                                button.trigger.send()
                            }, label: {
                                button.icon
                            })
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        ForEach(buttonsRight) { button in
                            Button(action: {
                                button.trigger.send()
                            }, label: {
                                button.icon
                            })
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
        buttonsLeft: left,
        buttonsRight: right
    )
}
