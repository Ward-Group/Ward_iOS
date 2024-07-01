//
//  ReleaseView.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import SwiftUI

struct ReleaseView: View {
    
    @ObservedObject private var output: ReleaseViewModel.Output
    private let cancelBag = CancelBag()
    
    init(vm: ReleaseViewModel) {
        let input = ReleaseViewModel.Input()
        let output = vm.transform(input, cancelBag: cancelBag)
        self.output = output
    }
    
    var body: some View {
        Text("Release View")
    }
}

#Preview {
    ReleaseView(vm: ReleaseViewModel())
}
