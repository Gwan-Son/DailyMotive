//
//  CategoryQuoteViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import Foundation

final class QuoteViewModel: ObservableObject {
    
    @Published private(set) var quotes: [Quotes]
    
    init(quotes: [Quotes]) {
        self.quotes = quotes
    }
    
    func filterQuotes(for category: Category) -> [Quotes] {
        return quotes.filter { $0.category == category.id }
    }
}
