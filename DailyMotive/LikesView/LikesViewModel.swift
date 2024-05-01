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
    
    init() {
        self.likesQuoteList = likesQuoteManger.loadLikesQuote()
        print(likesQuoteList)
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
