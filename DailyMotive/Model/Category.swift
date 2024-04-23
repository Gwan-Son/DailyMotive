//
//  Category.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import Foundation

struct Category: Hashable, Identifiable {
    
    let id: Int
    let name: String
}

extension Category {
    static let list = [
        Category(id: 1, name: "사랑"),
        Category(id: 2, name: "인생"),
        Category(id: 3, name: "공부"),
        Category(id: 4, name: "성공"),
        Category(id: 5, name: "친구"),
        Category(id: 6, name: "독서")
    ]
}
