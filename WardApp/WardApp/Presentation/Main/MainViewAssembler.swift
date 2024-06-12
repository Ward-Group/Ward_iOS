//
//  MainViewAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import SwiftUI

class MainViewAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let router: MainRouter = resolve()
        let vm: MainViewModel = MainViewModel(authUsecase: resolve(), router: router)
        MainView(vm: vm)
            .environmentObject(router)
    }
    
    func resolve() -> MainRouter {
        return MainRouter()
    }
    
    private func resolve() -> AuthUseCase {
        return AuthUseCase(repository: resolve())
    }
    
    private func resolve() -> AuthRepository {
        return AuthRepository()
    }
}
