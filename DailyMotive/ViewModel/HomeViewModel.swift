//
//  HomeViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var selectedTab: Tab
    
    init(selectedTab: Tab = .home) {
        self.selectedTab = selectedTab
    }
    
}
