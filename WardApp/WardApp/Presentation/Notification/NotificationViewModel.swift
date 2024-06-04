//
//  NotificationViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import Foundation
import Combine

struct NotificationViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let currentTabTrigger: Driver<WardSegmentedControlTab>
        
        init(currentTabTrigger: Driver<WardSegmentedControlTab>) {
            self.currentTabTrigger = currentTabTrigger
        }
    }
    
    final class Output: ObservableObject {
        let tabs = [
            WardSegmentedControlTab(id: "all", title: WardStrings.all),
            WardSegmentedControlTab(id: "interested", title: WardStrings.interested)
        ]
        
        @Published var currentTab = WardSegmentedControlTab(id: "all", title: WardStrings.all)
        @Published var items = [NotificationItem]()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        output.items = getItems()
        
        input.currentTabTrigger
            .assign(to: \.currentTab, on: output)
            .store(in: cancelBag)
        
        return output
    }
    
    func getItems() -> [NotificationItem] {
        return [
            NotificationItem(title: "마뗑킴 잡화라인 오픈", subtitle: "마뗑킴 잡화라인 오픈", createdAt: Date.now.addingTimeInterval(-3600), isNew: true),
            NotificationItem(title: "마뗑킴 잡화라인 오픈", subtitle: "마뗑킴 잡화라인 오픈", createdAt: Date.now.addingTimeInterval(-36000), isNew: true),
            NotificationItem(title: "마뗑킴 잡화라인 오픈", subtitle: "마뗑킴 잡화라인 오픈", createdAt: Date.now.addingTimeInterval(-360000), isNew: false)
        ]
    }
}
