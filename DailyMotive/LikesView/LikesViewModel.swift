//
//  LikesViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/30/24.
//

import Foundation

final class LikesViewModel: ObservableObject {
    let likesQuoteManger = LikesQuoteManager.shared
    
    @Published var likesQuoteList: [Quotes] = []
    
    @Published var isShowingLikesView: Bool = false
    
    @Published var selectedQuote: Quotes = Quotes(author: "", quote: "", category: 0)
    
    init() {
        self.likesQuoteList = likesQuoteManger.loadLikesQuote()
    }
    
    func addQuote(with quote: Quotes) {
        likesQuoteList.append(quote)
        likesQuoteManger.saveLikesQuote(likesQuoteList)
        print(quote)
    }
    
    func deleteQuote(with quote: Quotes) {
        likesQuoteList.removeAll { $0 == quote}
        likesQuoteManger.saveLikesQuote(likesQuoteList)
        print(likesQuoteList)
    }
}
