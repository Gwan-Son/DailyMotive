//
//  MainView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import SwiftUI
import Combine

struct MainView: View {
    
    var temp: [Quotes] = []
    
    var viewModel: QuoteViewModel = QuoteViewModel(network: NetworkService(configuration: .default))
    
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
            let url = URL(string: "https://raw.githubusercontent.com/Gwan-Son/DailyMotive/main/quotes.json")
            let session = URLSession.shared
            let task = session.dataTask(with: url!) { data, response, error in
                if let error = error {
                    print("error: \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    print("Invalid response")
                    return
                }
                
                if let data = data {
                    if let dataString = String(data: data, encoding: .utf8) {
                        print("Received Data: \(dataString)")
                    }
                }
            }
            task.resume()
            
            
            
            viewModel.quoteLoad()
            
            print(viewModel.$quotes)
            
        }
    }
}

#Preview {
    MainView()
}
