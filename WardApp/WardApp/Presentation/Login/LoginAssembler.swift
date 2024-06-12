//
//  LoginAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 5/27/24.
//

import SwiftUI

struct LoginAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let router = LoginRouter()
        let vm = LoginViewModel(authUsecase: resolve(), router: router)
        LoginView(vm: vm)
            .environmentObject(router)
    }

    private func resolve() -> AuthUseCase {
        return AuthUseCase(repository: resolve())
    }
    
    private func resolve() -> AuthRepository {
        return AuthRepository()
    }
    
    func resolve() -> SignUpViewModel {
        return SignUpViewModel(authUsecase: resolve())
    }
}
