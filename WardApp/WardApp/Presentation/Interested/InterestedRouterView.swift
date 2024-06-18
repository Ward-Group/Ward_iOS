//
//  InterestedRouterView.swift
//  WardApp
//
//  Created by peppermint100 on 6/2/24.
//

import SwiftUI

struct InterestedRouterView: View {
    
    var vm: InterestedViewModel
    @ObservedObject var router: InterestedRouter
    
    var body: some View {
        NavigationStack(path: $router.path) {
            InterestedView(vm: vm)
                .navigationDestination(for: InterestedRouter.Page.self) { page in
                    router.build(page: page)
                }
        }
        .environmentObject(router)
    }
}
