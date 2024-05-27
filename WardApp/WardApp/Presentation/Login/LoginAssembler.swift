//
//  LoginAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 5/27/24.
//

import Foundation

protocol LoginAssembler {
    func resolve() -> LoginView
    func resolve() -> LoginViewModel
    func resolve() -> AuthUseCase
}

class LoginAssemblerImpl: LoginAssembler {
}

extension LoginAssembler {
    func resolve() -> LoginView {
        return LoginView(vm: resolve())
    }
}

extension LoginAssembler {
    func resolve() -> LoginViewModel {
        return LoginViewModel(authUsecase: resolve())
    }
}

extension LoginAssembler {
    func resolve() -> AuthUseCase {
        return AuthUseCase()
    }
}
