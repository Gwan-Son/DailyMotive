//
//  Quotes.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import Foundation

struct Quotes: Hashable, Codable, Identifiable {
    
    var id: UUID = UUID()
    var author: String
    var quote: String
    var category: Int
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
    
    enum CodingKeys: String, CodingKey {
        case author
        case quote
        case category
    }
}

extension Quotes {
    static let mock = Quotes(author: "작가", quote: "명언", category: 1)
}
