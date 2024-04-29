//
//  RandomQuoteViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import Foundation

final class RandomQuoteViewModel: ObservableObject {
    
    @Published private(set) var quotes: [Quotes]
    
    // 현재 선택된 명언
    private var currentQuote: Quotes?
    
    init() {
        self.quotes = []
    }
    
    func setup(with quotes: [Quotes]) {
        self.quotes = quotes
    }
    
    func randomQuote() -> Quotes? {
        var randomQuote: Quotes?
        repeat {
            randomQuote = quotes.randomElement()
        } while randomQuote == currentQuote
        currentQuote = randomQuote
        return randomQuote
    }
    
    func updateRandomQuote() {
        objectWillChange.send()
    }
}
