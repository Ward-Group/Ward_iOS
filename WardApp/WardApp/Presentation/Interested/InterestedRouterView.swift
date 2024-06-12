//
//  InterestedRouterView.swift
//  WardApp
//
//  Created by peppermint100 on 6/2/24.
//

import SwiftUI

struct InterestedRouterView: View {
    
    @StateObject private var router: InterestedRouter = InterestedAssembler().resolve()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.build(page: .root)
                .navigationDestination(for: InterestedRouter.Page.self) { page in
                    router.build(page: page)
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    InterestedRouterView()
}
