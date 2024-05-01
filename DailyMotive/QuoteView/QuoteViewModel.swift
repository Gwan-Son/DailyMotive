//
//  CategoryQuoteViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import Foundation

final class QuoteViewModel: ObservableObject {
    
    @Published private(set) var quotes: [Quotes]
    
    @Published var isShowingDetailView = false
    
    @Published var selectedQuote: Quotes = Quotes(author: "", quote: "", category: 0)
    
    init(quotes: [Quotes]) {
        self.quotes = quotes
    }
    
    func filterQuotes(for category: Category) -> [Quotes] {
        return quotes.filter { $0.category == category.id }
    }
}
