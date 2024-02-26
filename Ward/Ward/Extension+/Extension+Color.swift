//
//  Extension+Color.swift
//  Ward
//
//  Created by 강신규 on 2/26/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
      let scanner = Scanner(string: hex)
      _ = scanner.scanString("#")
      
      var rgb: UInt64 = 0
      scanner.scanHexInt64(&rgb)
      
      let r = Double((rgb >> 16) & 0xFF) / 255.0
      let g = Double((rgb >>  8) & 0xFF) / 255.0
      let b = Double((rgb >>  0) & 0xFF) / 255.0
      self.init(red: r, green: g, blue: b)
    }
    
    
    static let mainBlue = Color(hex: "0048FF")
    static let darkGray = Color(hex: "7C7C7C")
    static let mainRed = Color(hex: "FF3F3F")
    static let white3 = Color(hex: "D9D9D9")
    static let white2 = Color(hex: "E1E1E1")
    static let white1 = Color(hex: "E7E7E7")
    static let black5 = Color(hex: "000000")
    static let black4 = Color(hex: "333333")
    static let black3 = Color(hex: "5C5C5C")
    static let black2 = Color(hex: "7D7D7D")
    static let black1 = Color(hex: "979797")
    static let mainGray = Color(hex: "F2F4F6")
    
}
