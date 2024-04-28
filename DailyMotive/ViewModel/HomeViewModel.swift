//
//  HomeViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    // 여기서 JSON 파일을 불러오고 뿌리는게 좋을 것 같음
    
    @Published var selectedTab: Tab
    
    init(selectedTab: Tab = .home) {
        self.selectedTab = selectedTab
    }
    
}
