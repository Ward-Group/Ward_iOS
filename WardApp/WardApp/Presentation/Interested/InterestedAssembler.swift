//
//  InterestedAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 5/30/24.
//

import Foundation
import SwiftUI

protocol InterestedAssembler {
    func resolve() -> InterestedView
    func resolve() -> InterestedViewModel
    func resolve() -> InterestedRouter
}

class InterestedAssemblerImpl: InterestedAssembler {
}

extension InterestedAssembler {
    func resolve() -> InterestedView {
        return InterestedView(vm: resolve())
    }
}

extension InterestedAssembler {
    func resolve() -> InterestedViewModel {
        return InterestedViewModel()
    }
}

extension InterestedAssembler {
    func resolve() -> InterestedRouter {
        return InterestedRouter()
    }
}

