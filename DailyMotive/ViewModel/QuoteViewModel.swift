//
//  QuoteViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import Foundation
import Combine

final class QuoteViewModel: ObservableObject {

    let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    // Quotes들이 담길 배열
    @Published private(set) var quotes = [Quotes]()
    
    func quoteLoad() {
        let resource: Resource<QuoteResponse> = Resource(
            base: "https://raw.githubusercontent.com/",
            path: "Gwan-Son/DailyMotive/main/quotes.json",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .print("DEBUG: ")
            .map { $0.quotes }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.quotes, on: self)
            .store(in: &subscriptions)
    }
    
}
