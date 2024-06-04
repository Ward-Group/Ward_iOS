//
//  UIApplication.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
