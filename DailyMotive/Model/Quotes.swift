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
        Quotes(author: "버트런트 러셀", quote: "사랑을 두려워하는 것은 삶을 두려워하는 것과 같으며, 삶을 두려워 하는 사람은 이미 세 부분이 죽은 상태다.", category: 1),
        Quotes(author: "빌 게이츠", quote: "여러분의 선생님이 엄격하다고 생각한다면, 직장 상사를 만날 때까지 기다려보세요. 상사는 (선생님처럼) 종신제가 아니니까요.(더 엄격할 거예요.)", category: 2),
        Quotes(author: "캐슬린 노리스", quote: "무엇을 시작하기 전에, 예측할 수 없는 어려움과 지연이 기다리고 있다는 점을 기억하라. 이를 분명히 볼 수 있다면, 당연히 이를 제거할 수 있겠지만, 그럴 수 없다. 당신은 단 한 가지만을 분명히 볼 수 있고, 그것은 당신의 목표다. 머리 속에 목표에 대한 비전을 구상하고 어떤 고난이 있어도 그것을 고수하라.", category: 4)
    ]
}
