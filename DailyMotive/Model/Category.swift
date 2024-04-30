//
//  Category.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import Foundation
import SwiftUI

struct Category: Hashable, Identifiable {
    
    let id: Int
    let name: String
    
    func imageName(id: Int) -> Image? {
        let imageName: String
        switch id {
        case 1:
            imageName = "1_love"
        case 2:
            imageName = "2_life"
        case 3:
            imageName = "3_study"
        case 4:
            imageName = "4_success"
        case 5:
            imageName = "5_friend"
        case 6:
            imageName = "6_readingBooks"
        case 7:
            imageName = "7_breakUp"
        case 8:
            imageName = "8_time"
        case 9:
            imageName = "9_effort"
        case 10:
            imageName = "10_hope"
        case 11:
            imageName = "11_challenge"
        case 12:
            imageName = "12_confidence"
        default:
            return nil
        }
        return Image(imageName)
    }
}
// 1 - Love
// 2 - Life
// 3 - Study
// 4 - Success
// 5 - Friend
// 6 - ReadingBooks
// 7 - BreakUp
// 8 - Time
// 9 - Effort
// 10 - Hope
// 11 - Challenge
// 12 - Confidence
extension Category {
    static let list = [
        Category(id: 1, name: "사랑"),
        Category(id: 2, name: "인생"),
        Category(id: 3, name: "공부"),
        Category(id: 4, name: "성공"),
        Category(id: 5, name: "친구"),
        Category(id: 6, name: "독서"),
        Category(id: 7, name: "이별"),
        Category(id: 8, name: "시간"),
        Category(id: 9, name: "노력"),
        Category(id: 10, name: "희망"),
        Category(id: 11, name: "도전"),
        Category(id: 12, name: "자신감")
    ]
}
