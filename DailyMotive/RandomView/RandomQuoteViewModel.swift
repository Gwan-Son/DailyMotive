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
    @Published var currentQuote: Quotes?
    
    init() {
        self.quotes = Quotes.list
        self.randomQuote()
    }
    
    func setup(with quotes: [Quotes]) {
        self.quotes = quotes
    }
    
    func randomQuote() {
        var randomQuote: Quotes?
        repeat {
            randomQuote = quotes.randomElement()
        } while randomQuote == currentQuote
        currentQuote = randomQuote!
    }
    
    func updateRandomQuote() {
        objectWillChange.send()
        print("ObjectWillChange!!!")
    }
}
