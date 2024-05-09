//
//  SettingViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/8/24.
//

import Foundation
import SwiftUI

final class SettingViewModel: ObservableObject {
    
    @Published private(set) var name = ["애플기본", "런드리고딕", "영주선비체", "강원교육모두Light", "산하엽", "부크크명조 얇은글씨", "온글잎 매일옥자체", "다이어리체"]
    @Published private(set) var data = ["AppleSDGothicNeo-Regular", "OTLaundryGothicR", "YEONGJUSeonbi", "GangwonEduAll-OTFLight", "Diphylleia-Regular", "BookkMyungjo-Lt", "Ownglyph_Dailyokja-Rg", "EF_Diary"]
    @Published private(set) var value: [Fonts] = [.apple, .laundry, .sunbi, .gwonAll, .diphy, .bkkLT, .dailyOJ, .efDiary]

    func changeFont(index: Int) -> Fonts {
        FontManager.applyFont(font: value[index])
        return value[index]
    }
    
    func showFont(index: Int) -> Font {
        return .custom(data[index], size: 14)
    }
}
