//
//  LogoNavBarView.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import SwiftUI
import Combine

struct LogoNavBarView: View {
    let buttonsRight: [NavigationBarButton]
    
    init(buttonsRight: [NavigationBarButton] = []) {
        self.buttonsRight = buttonsRight
    }
    
    var body: some View {
        ZStack {
            Color.background
            
            VStack {
                
                HStack {
                    WardAssets.Image.wardLogo.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                    
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
            }
            
        }
        .frame(maxHeight: 45, alignment: .top)
    }
}

#Preview {
    let right: [NavigationBarButton] = [
        NavigationBarButton(style: .gear, trigger: PassthroughSubject<Void, Never>())
    ]
    
    return LogoNavBarView(
        buttonsRight: right
    )
}
