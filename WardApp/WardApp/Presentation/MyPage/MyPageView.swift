//
//  MyPageView.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import SwiftUI

struct MyPageView: View {
    
    @ObservedObject private var input: MyPageViewModel.Input
    @ObservedObject private var output: MyPageViewModel.Output
    
    private let cancelBag = CancelBag()
    
    init(vm: MyPageViewModel) {
        let input = MyPageViewModel.Input()
        let output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
        self.output = output
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MyPageAssembler().view()
}
