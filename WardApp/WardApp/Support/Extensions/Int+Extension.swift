//
//  Int.swift
//  WardApp
//
//  Created by peppermint100 on 5/30/24.
//

import Foundation


// Item 가격
extension Int {
    
    func formatPriceAsWon() -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: self) else {
            return "\(self)\(WardStrings.koreanCurrencyWon)"
        }
        
        return "\(result)\(WardStrings.koreanCurrencyWon)"
    }
}
