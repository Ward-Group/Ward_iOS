//
//  NotificationAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import SwiftUI

class NotificationAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let vm: NotificationViewModel = resolve()
        NotificationView(vm: vm)
    }

    func resolve() -> NotificationView {
        return NotificationView(vm: resolve())
    }
    
    func resolve() -> NotificationViewModel {
        return NotificationViewModel()
    }
}
