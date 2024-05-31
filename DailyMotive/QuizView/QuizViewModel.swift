//
//  QuizViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/27/24.
//

import Foundation

final class QuizViewModel: ObservableObject {
    @Published var shuffledQuotes: [Quotes] = []
    @Published var currentQuote: Quotes = Quotes(author: "", quote: "", category: 0)
    @Published var selectedAuthor: String = ""
    @Published var showResult: Bool = false
    @Published var isShowingDetail: Bool = false
    
    func showingDetail() {
        isShowingDetail = true
    }
    
    func loadNewQuote(quote: [Quotes]) {
        if !quote.isEmpty {
            var seenAuthor: Set<String> = []
            shuffledQuotes.removeAll()
            for element in quote.shuffled() {
                if seenAuthor.contains(element.author) == false {
                    shuffledQuotes.append(element)
                    seenAuthor.insert(element.author)
                }
                if shuffledQuotes.count == 4 {
                    break
                }
            }
            currentQuote = shuffledQuotes.randomElement()!
            showResult = false
        }
    }
}
