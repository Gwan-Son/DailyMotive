//
//  Quotes.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import Foundation

struct Quotes: Hashable, Decodable, Identifiable {
    
    var id = UUID()
    var author: String
    var quote: String
    
    enum CodingKeys: String, CodingKey {
        case author
        case quote
    }
}

extension Quotes {
    static let mock = Quotes(author: "작가", quote: "명언")
}
