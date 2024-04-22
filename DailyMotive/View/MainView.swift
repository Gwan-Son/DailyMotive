//
//  MainView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import SwiftUI

struct MainView: View {
    
    var viewModel = QuoteViewModel(network: NetworkService(configuration: .default))
    
    var body: some View {
        
        // TODO: - Notification Setting
        
        
        // TODO: - 오늘의 명언
        // JSON -> Decoding -> UI
        // 카테고리는 나중에 만들고
        // 깃허브에 업로드 된 JSON을 받아서 뿌리는 걸로 대체.
        VStack {
            Text("Hello, World!")
            Text("카테고리")
        }
        .onAppear {
            viewModel.loadQuotes()
            print(viewModel.$quotes)
            
        }
    }
}

#Preview {
    MainView(viewModel: QuoteViewModel(network: .init(configuration: .default)))
}
