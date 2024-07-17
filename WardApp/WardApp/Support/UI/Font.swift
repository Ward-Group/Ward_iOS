//
//  Font.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import Foundation
import SwiftUI

/**
 # (S) TitleFont
 - Authors: suni
 - Note:Title Font 전역 설정
 */
struct TitleFont: ViewModifier {
    let size: CGFloat
     
    func body(content: Content) -> some View {
        return content.font(WardFonts.Pretendard.semiBold.swiftUIFont(size: size)).foregroundStyle(WardAssets.Color.black6.swiftUIColor)
    }
}

extension View {
    var titleStyle: some View {
        ModifiedContent(content: self, modifier: TitleFont(size: 24))
    }
}
