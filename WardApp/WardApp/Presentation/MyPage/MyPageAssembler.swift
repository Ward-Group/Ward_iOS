//
//  MyPageAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import SwiftUI

class MyPageAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let router: MyPageRouter = resolve()
        MyPageView(vm: resolve())
            .environmentObject(router)
    }
    
    func resolve() -> MyPageViewModel {
        return MyPageViewModel(authUseCase: resolve())
    }
    
    func resolve() -> MyPageRouter {
        return MyPageRouter()
    }
    
    func resolve() -> AuthUseCase {
        return AuthUseCase(repository: resolve())
    }
    
    func resolve() -> AuthRepository {
        return AuthRepository()
    }
}
