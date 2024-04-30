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
