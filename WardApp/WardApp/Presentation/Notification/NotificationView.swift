//
//  NotificationView.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import SwiftUI
import Combine

struct NotificationView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var input: NotificationViewModel.Input
    @ObservedObject var output: NotificationViewModel.Output
    
    private var currentTabTrigger = PassthroughSubject<WardSegmentedControlTab, Never>()
    private var backButtonTrigger = PassthroughSubject<Void, Never>()
    private var settingButtonTrigger = PassthroughSubject<Void, Never>()
    
    private let cancelBag = CancelBag()
    
    init(vm: NotificationViewModel) {
        let input = NotificationViewModel.Input(
            currentTabTrigger: currentTabTrigger.asDriver()
        )
        self.output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        ZStack {
            Color.background
            GeometryReader { geo in
                VStack {
                    InlineNavBarView(
                        title: WardStrings.notifications,
                        buttonsRight: [NavigationBarButton(style: .back, trigger: backButtonTrigger)],
                        buttonsLeft: [NavigationBarButton(style: .gear, trigger: settingButtonTrigger)]
                    )
                    WardSegementedControl(
                        tabs: output.tabs, currentTab: $output.currentTab,
                        active: Color.mainBlue, inactive: Color.black3
                    )
                        .frame(width: geo.size.width, height: 45)
                    
                    if output.items.isEmpty {
                        empty
                    } else {
                        itemList
                    }
                    
                }
            }
            .onReceive(backButtonTrigger, perform: { _ in
                dismiss()
            })
        }
    }
}

extension NotificationView {
    private var itemList: some View {
        ScrollView {
            LazyVStack {
                ForEach(output.items, id: \.id) { item in
                    NotificationItemRowView(item: item)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 85)
                    
                    Divider()
                        .padding(.top, 15)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    private var empty: some View {
        Group {
            Spacer()
            Text(WardStrings.notificationsDoNotExist)
                .multilineTextAlignment(.center)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.gray3)
            Spacer()
        }
    }
}

#Preview {
    NotificationAssembler().view()
}
