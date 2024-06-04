//
//  NoticeBoardAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import Foundation

protocol NoticeBoardAssembler {
    func resolve() -> NoticeBoardView
    func resolve() -> NoticeBoardViewModel
}

class NoticeBoardAssemblerImpl: NoticeBoardAssembler {
}

extension NoticeBoardAssembler {
    func resolve() -> NoticeBoardView {
        return NoticeBoardView(vm: resolve())
    }
}

extension NoticeBoardAssembler {
    func resolve() -> NoticeBoardViewModel {
        return NoticeBoardViewModel()
    }
}
