//
//  StyleModifier.swift
//  WardApp
//
//  Created by peppermint100 on 5/7/24.
//

import SwiftUI

struct LoginButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 325, height: 60)
            .cornerRadius(16)
    }
}

extension View {
    func loginButtonStyle() -> some View {
        modifier(LoginButtonModifier())
    }
}
