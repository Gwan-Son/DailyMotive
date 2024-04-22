//
//  QuoteViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import Foundation
import Combine

final class QuoteViewModel: ObservableObject {

    // Quotes들이 담길 배열
    @Published private(set) var quotes = [Quotes]()
    
}
