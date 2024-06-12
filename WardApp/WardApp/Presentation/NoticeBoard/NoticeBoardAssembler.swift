//
//  NoticeBoardAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import SwiftUI

class NoticeBoardAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let vm = NoticeBoardViewModel()
        NoticeBoardView(vm: vm)
    }
    
    func resolve() -> NoticeBoardView {
        return NoticeBoardView(vm: resolve())
    }
    
    func resolve() -> NoticeBoardViewModel {
        return NoticeBoardViewModel()
    }
}
