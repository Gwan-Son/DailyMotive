//
//  QuizView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/22/24.
//

import SwiftUI

struct QuizView: View {
    
    var quotes = Quotes.list
    
    var body: some View {
        VStack {
            Text(quotes[0].quote)
                .font(.title)
                .padding()
            ForEach(0..<4, id: \.self) { _ in
                Button(action: {
                    // viewModel에서 answer과 비교 후 정답 표시
                }) {
                    Text("option")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(2)
            }
        }
    }
}

#Preview {
    QuizView()
}
