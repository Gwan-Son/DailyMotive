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
    }
}
