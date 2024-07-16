//
//  PageControl.swift
//  WardApp
//
//  Created by suni on 6/19/24.
//

import SwiftUI

struct PageControl: View {
    @Binding var numberOfPage: Int
    @Binding var currentPage: Int?
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPage, id: \.self) { index in
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(index == currentPage ? .mainBlue : .white3)
            }
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue: Value = 0
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct PageControl_Previews: PreviewProvider {
    @State static var numberOfPage: Int = 2
    @State static var currentPage: Int? = 0
    
    static var previews: some View {
        PageControl(numberOfPage: $numberOfPage, currentPage: $currentPage)
    }
}
