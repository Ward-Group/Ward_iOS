//
//  SettingView.swift
//  WardApp
//
//  Created by peppermint100 on 6/24/24.
//

import SwiftUI
import Combine

struct SettingView: View {
    
    @EnvironmentObject var router: MyPageRouter
    @ObservedObject private var output: SettingViewModel.Output
    
    private let cancelBag = CancelBag()
    private let backButtonTrigger = PassthroughSubject<Void, Never>()
    
    init(vm: SettingViewModel) {
        let input = SettingViewModel.Input()
        let output = vm.transform(input, cancelBag: cancelBag)
        self.output = output
    }
    
    var body: some View {
        ZStack {
            Color.background
            GeometryReader { geo in
                VStack {
                    InlineNavBarView(
                        title: WardStrings.setting,
                        buttonsLeft: [NavigationBarButton(style: .back, trigger: backButtonTrigger)])
                    .padding(.bottom, 5)
                    
                    Divider()
                    .padding(.bottom)
                    
                    VStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            SectionHeaderView(title: WardStrings.general)
                            SectionListItemView(title: WardStrings.loginInformation)
                        }
                        
                        VStack(alignment: .leading) {
                            SectionHeaderView(title: WardStrings.notifications)
                            SectionListItemView(title: WardStrings.notificationSetting)
                        }
                        
                        VStack(alignment: .leading) {
                            SectionHeaderView(title: WardStrings.information)
                            SectionListItemView(title: WardStrings.submitOpinion)
                            SectionListItemView(title: WardStrings.reviewAndRatings)
                        }
                        
                        VStack(alignment: .leading) {
                            SectionHeaderView(title: WardStrings.etc)
                            SectionListItemView(title: WardStrings.termsOfService)
                            SectionListItemView(title: WardStrings.personalInformationPolicy)
                            SectionListItemView(title: WardStrings.removeCache)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onReceive(backButtonTrigger, perform: { _ in
            router.pop()
        })
    }
}

#Preview {
    SettingAssembler().view()
}
