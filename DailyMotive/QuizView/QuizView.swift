//
//  QuizView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/22/24.
//

import SwiftUI

struct QuizView: View {
    
    
    var questions = [
        QuizQuestion(quote: Quotes(author: "버트런트 러셀", quote: "사랑을 두려워하는 것은 삶을 두려워하는 것과 같으며, 삶을 두려워 하는 사람은 이미 세 부분이 죽은 상태다.", category: 1),
                     options: ["Nelson Mandela", "Albert Einstein", "Mark Twain", "Walt Disney"],
                     correctOption: "Nelson Mandela"),
        QuizQuestion(quote: Quotes(author: "마더 테레사", quote: "강렬한 사랑은 판단하지 않는다. 주기만 할 뿐이다.", category: 1),
                     options: ["Steve Jobs", "Walt Disney", "Bill Gates", "Henry Ford"],
                     correctOption: "Walt Disney")
        // 더 많은 질문 추가 가능
    ]
    
    var body: some View {
        VStack {
            Text(questions[0].quote.quote)
                .font(.title)
                .padding()
            ForEach(questions[0].options, id: \.self) { option in
                Button(action: {
//                    viewModel.checkAnswer(option)
                }) {
                    Text(option)
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

struct QuizQuestion: Identifiable {
    let id = UUID()
    let quote: Quotes
    let options: [String]
    let correctOption: String
}

#Preview {
    QuizView()
}
