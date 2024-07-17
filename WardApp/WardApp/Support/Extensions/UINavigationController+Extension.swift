//
//  UINavigationController.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import UIKit

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
