//
//  QuizView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/22/24.
//

import SwiftUI

struct QuizView: View {
    
    @State private var quotes = Quotes.list
    @State private var currentQuote: Quotes?
    @State private var selectedAuthor: String = ""
    @State private var showResult: Bool = false
    
    private let customFont = FontManager.currentFont()
    
    var body: some View {
        VStack {
            Spacer()
            if let currentQuote = currentQuote {
                Text(currentQuote.quote)
                    .font(customFont.quoteFont)
                    .padding()
                
                ForEach(quotes.shuffled(), id: \.id) { quote in
                    Button {
                        selectedAuthor = quote.author
                        showResult = true
                    } label: {
                        Text(quote.author)
                            .font(customFont.authorFont)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                    }
                }
                Spacer()
            } else {
                LoadingView()
            }
        }
        .onAppear(perform: loadNewQuote)
        .alert(isPresented: $showResult) {
            Alert(
                title: Text(selectedAuthor == currentQuote?.author ? "Correct!" : "Wrong"),
                message: Text(selectedAuthor == currentQuote?.author ? "You got it right!" : "The correct answer was \(currentQuote?.author ?? "")"),
                dismissButton: .default(Text("Next"), action: loadNewQuote))
        }
    }
    
    func loadNewQuote() {
        if !quotes.isEmpty {
            currentQuote = quotes.randomElement()
            showResult = false
        }
    }
}

#Preview {
    QuizView()
}
