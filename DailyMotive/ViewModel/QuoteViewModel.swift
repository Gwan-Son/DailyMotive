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
        self.quoteLoad()
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var category: [Category] = Category.list
    
    // Quotes들이 담길 배열
    @Published private(set) var quotes = [Quotes]()
    
    // 로딩 중인지
    @Published var isLoading: Bool = false
    
    // 현재 선택된 명언
    private var currentQuote: Quotes?
    
    func quoteLoad() {
        // 데이터 로딩 중
        isLoading = true
        
        let resource: Resource<QuoteResponse> = Resource(
            base: "https://raw.githubusercontent.com/",
            path: "Gwan-Son/DailyMotive/main/quotes.json"
        )
        
        network.load(resource)
            .print("DEBUG: ")
            // "quotes" 이름만 가져옴
            .map { $0.quotes }
            // 에러처리는 빈 배열로 리턴
            .replaceError(with: [])
            // 해당 코드가 돌아갈 쓰레드
            .receive(on: RunLoop.main)
            // 가져온 결과값을 quotes 배열에 저장
            .sink(receiveValue: { [weak self] fetchQuotes in
                self?.quotes = fetchQuotes
                self?.isLoading = false // 데이터 로딩 완료
            })
            .store(in: &subscriptions)
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
    
    func filterQuotes(for category: Category) -> [Quotes] {
        return quotes.filter { $0.category == category.id }
    }
}
