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

struct PretendardRegularWhite: ViewModifier {
    let size: CGFloat
     
    func body(content: Content) -> some View {
        return content.font(WardFonts.Pretendard.regular.swiftUIFont(size: size)).foregroundStyle(WardAssets.Color.white0.swiftUIColor)
    }
}

extension View {
    // TODO: [디자인 요청] weight으로 폰트를 구분해야 하는지..
    var titleStyle: some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: 24))
    }
    
    var fontPretendardRegularWhite: some View {
        return ModifiedContent(content: self, modifier: PretendardRegularWhite(size: 16))
    }
}
