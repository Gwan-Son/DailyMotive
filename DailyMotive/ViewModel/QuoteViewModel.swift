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
    
    func quoteLoad() {
        // 데이터 로딩 중
        isLoading = true
        
        let resource: Resource<QuoteResponse> = Resource(
            base: "https://raw.githubusercontent.com/",
            path: "Gwan-Son/DailyMotive/main/quotes.json"
        )
        
        network.load(resource)
            // 디버깅용 코드
            .print("DEBUG: ")
            // "quotes" 이름만 가져옴
            .map { $0.quotes }
            // 에러처리는 빈 배열로 리턴
            .replaceError(with: [])
            // 해당 코드가 돌아갈 쓰레드
            .receive(on: DispatchQueue.main)
            // 가져온 결과값을 quotes 배열에 저장
            .sink(receiveValue: { [weak self] fetchQuotes in
                self?.quotes = fetchQuotes
                self?.isLoading = false // 데이터 로딩 완료
            })
            .store(in: &subscriptions)
    }
}
