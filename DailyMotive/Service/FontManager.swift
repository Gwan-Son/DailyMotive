//
//  FontManager.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/3/24.
//

import SwiftUI
import Foundation

enum Fonts: Int {
    case laundry
    
    var quoteFont: Font {
        switch self {
        case .laundry:
            return .custom("OTLaundryGothicR", size: 18)
        }
    }
    
    var authorFont: Font {
        switch self {
        case .laundry:
            return .custom("OTLaundryGothicR", size: 14)
        }
    }
    
    var cellFont: Font { // cell
        switch self {
        case .laundry:
            return .custom("OTLaundryGothicR", size: 10)
        }
    }
    
    var buttonFont: Font {
        switch self {
        case .laundry:
            return .custom("OTLaundryGothicR", size: 20)
        }
    }
    
    var categoryCellFont: Font {
        switch self {
        case .laundry:
            return .custom("OTLaundryGothicR", size: 28)
        }
    }
    
    var categoryFont: UIFont {
        switch self {
        case .laundry:
            return UIFont(name: "OTLaundryGothicR", size: 28)!
        }
    }
    
}

let selectedFontKey = "SelectedFont"

class FontManager {
    static func currentFont() -> Fonts {
        if let storedFont = (UserDefaults.standard.value(forKey: selectedFontKey) as AnyObject).integerValue {
            return Fonts(rawValue: storedFont)!
        } else { // 처음 폰트
            return .laundry
        }
    }
    
    static func applyFont(font: Fonts) {
        UserDefaults.standard.setValue(font.rawValue, forKey: selectedFontKey)
        UserDefaults.standard.synchronize()
    }
}
