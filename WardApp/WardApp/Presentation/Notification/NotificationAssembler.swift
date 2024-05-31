//
//  NotificationAssembler.swift
//  WardApp
//
//  Created by peppermint100 on 5/31/24.
//

import Foundation

protocol NotificationAssembler {
    func resolve() -> NotificationView
    func resolve() -> NotificationViewModel
}

class NotificationAssemblerImpl: NotificationAssembler {
}

extension NotificationAssembler {
    func resolve() -> NotificationView {
        return NotificationView(vm: resolve())
    }
}

extension NotificationAssembler {
    func resolve() -> NotificationViewModel {
        return NotificationViewModel()
    }
}
