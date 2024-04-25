//
//  Quotes.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import Foundation

struct Quotes: Hashable, Codable, Identifiable {
    
    var id: String {
        return quote
    }
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
    static let list = [
        Quotes(author: "마더 테레사", quote: "강렬한 사랑은 판단하지 않는다. 주기만 할 뿐이다.", category: 1),
        Quotes(author: "빌 게이츠", quote: "여러분의 선생님이 엄격하다고 생각한다면, 직장 상사를 만날 때까지 기다려보세요. 상사는 (선생님처럼) 종신제가 아니니까요.(더 엄격할 거예요.)", category: 2)
    ]
}
