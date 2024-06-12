//
//  InterestedRouter.swift
//  WardApp
//
//  Created by peppermint100 on 6/1/24.
//

import SwiftUI

class InterestedRouter: ObservableObject {
    
    enum Page: Hashable {
        case root
        case detail(item: InterestedItem)
    }
    
    @Published var path = NavigationPath()
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .root:
            InterestedAssembler().view()
        case .detail(let item):
            Text(item.name)
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
