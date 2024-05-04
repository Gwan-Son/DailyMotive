//
//  FontManager.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/3/24.
//

import SwiftUI
import Foundation

enum Fonts: Int {
    case apple, laundry, sunbi, gwonAll, diphy, bkkLT, dailyOJ, efDiary
    
    var quoteFont: Font {
        switch self {
        case .apple:
            return .custom("AppleSDGothicNeo-Regular", size: 18)
        case .laundry:
            return .custom("OTLaundryGothicR", size: 18)
        case .sunbi:
            return .custom("YEONGJUSeonbi", size: 18)
        case .gwonAll:
            return .custom("GangwonEduAll-OTFLight", size: 18)
        case .diphy:
            return .custom("Diphylleia-Regular", size: 18)
        case .bkkLT:
            return .custom("BookkMyungjo-Lt", size: 18)
        case .dailyOJ:
            return .custom("Ownglyph_Dailyokja-Rg", size: 18)
        case .efDiary:
            return .custom("EF_Diary", size: 18)
        }
    }
    
    var authorFont: Font {
        switch self {
        case .apple:
            return .custom("AppleSDGothicNeo-Regular", size: 14)
        case .laundry:
            return .custom("OTLaundryGothicR", size: 14)
        case .sunbi:
            return .custom("YEONGJUSeonbi", size: 14)
        case .gwonAll:
            return .custom("GangwonEduAll-OTFLight", size: 14)
        case .diphy:
            return .custom("Diphylleia-Regular", size: 14)
        case .bkkLT:
            return .custom("BookkMyungjo-Lt", size: 14)
        case .dailyOJ:
            return .custom("Ownglyph_Dailyokja-Rg", size: 14)
        case .efDiary:
            return .custom("EF_Diary", size: 14)
        }
    }
    
    var cellFont: Font { // cell
        switch self {
        case .apple:
            return .custom("AppleSDGothicNeo-Regular", size: 10)
        case .laundry:
            return .custom("OTLaundryGothicR", size: 10)
        case .sunbi:
            return .custom("YEONGJUSeonbi", size: 10)
        case .gwonAll:
            return .custom("GangwonEduAll-OTFLight", size: 10)
        case .diphy:
            return .custom("Diphylleia-Regular", size: 10)
        case .bkkLT:
            return .custom("BookkMyungjo-Lt", size: 10)
        case .dailyOJ:
            return .custom("Ownglyph_Dailyokja-Rg", size: 10)
        case .efDiary:
            return .custom("EF_Diary", size: 10)
        }
    }
    
    var buttonFont: Font {
        switch self {
        case .apple:
            return .custom("AppleSDGothicNeo-Regular", size: 20)
        case .laundry:
            return .custom("OTLaundryGothicR", size: 20)
        case .sunbi:
            return .custom("YEONGJUSeonbi", size: 20)
        case .gwonAll:
            return .custom("GangwonEduAll-OTFLight", size: 20)
        case .diphy:
            return .custom("Diphylleia-Regular", size: 20)
        case .bkkLT:
            return .custom("BookkMyungjo-Lt", size: 20)
        case .dailyOJ:
            return .custom("Ownglyph_Dailyokja-Rg", size: 20)
        case .efDiary:
            return .custom("EF_Diary", size: 20)
        }
    }
    
    var categoryCellFont: Font {
        switch self {
        case .apple:
            return .custom("AppleSDGothicNeo-Regular", size: 28)
        case .laundry:
            return .custom("OTLaundryGothicR", size: 28)
        case .sunbi:
            return .custom("YEONGJUSeonbi", size: 28)
        case .gwonAll:
            return .custom("GangwonEduAll-OTFLight", size: 28)
        case .diphy:
            return .custom("Diphylleia-Regular", size: 28)
        case .bkkLT:
            return .custom("BookkMyungjo-Lt", size: 28)
        case .dailyOJ:
            return .custom("Ownglyph_Dailyokja-Rg", size: 28)
        case .efDiary:
            return .custom("EF_Diary", size: 28)
        }
    }
    
    var categoryFont: UIFont {
        switch self {
        case .apple:
            return UIFont(name: "AppleSDGothicNeo-Regular", size: 28)!
        case .laundry:
            return UIFont(name: "OTLaundryGothicR", size: 28)!
        case .sunbi:
            return UIFont(name: "YEONGJUSeonbi", size: 28)!
        case .gwonAll:
            return UIFont(name: "GangwonEduAll-OTFLight", size: 28)!
        case .diphy:
            return UIFont(name: "Diphylleia-Regular", size: 28)!
        case .bkkLT:
            return UIFont(name: "BookkMyungjo-Lt", size: 28)!
        case .dailyOJ:
            return UIFont(name: "Ownglyph_Dailyokja-Rg", size: 28)!
        case .efDiary:
            return UIFont(name: "EF_Diary", size: 28)!
        }
    }
    
}

let selectedFontKey = "SelectedFont"

class FontManager {
    static func currentFont() -> Fonts {
        if let storedFont = (UserDefaults.standard.value(forKey: selectedFontKey) as AnyObject).integerValue {
            return Fonts(rawValue: storedFont)!
        } else { // 처음 폰트
            return .gwonAll
        }
    }
    
    static func applyFont(font: Fonts) {
        UserDefaults.standard.setValue(font.rawValue, forKey: selectedFontKey)
        UserDefaults.standard.synchronize()
    }
}
