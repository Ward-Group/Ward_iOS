//
//  CategoryView.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var router: CategoryRouter
    private var output: CategoryViewModel.Output
    private let cancelBag = CancelBag()
    
    init(vm: CategoryViewModel) {
        let input = CategoryViewModel.Input()
        let output = vm.transform(input, cancelBag: cancelBag)
        self.output = output
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    LogoNavBarView()
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    
                    VStack {
                        CategoryRowView(title: WardStrings.items)
                        CategoryRowView(title: WardStrings.releaseInfo)
                        CategoryRowView(title: WardStrings.brand)
                        CategoryRowView(title: WardStrings.top50Now)
                        CategoryRowView(title: WardStrings.platform)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .background {
                    Color.mainGray
                }
            }
            .navigationDestination(for: CategoryRouter.Page.self) { page in
                router.build(page)
            }
        }
    }
}

#Preview {
    CategoryAssembler().view()
        .environmentObject(CategoryRouter())
}
