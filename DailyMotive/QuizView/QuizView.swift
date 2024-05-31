//
//  QuizView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/22/24.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @StateObject var quizViewModel = QuizViewModel()
    
    
    private let customFont = FontManager.currentFont()
    
    var body: some View {
        VStack {
            Spacer()
            
            if !quizViewModel.shuffledQuotes.isEmpty{
                Text("Q. 해당 명언을 한 위인을 골라주세요.")
                    .font(customFont.buttonFont)
                    .padding()
                
                Text(quizViewModel.currentQuote.quote)
                    .font(customFont.quoteFont)
                    .padding()
                
                ForEach(quizViewModel.shuffledQuotes, id: \.id) { quote in
                    Button {
                        quizViewModel.selectedAuthor = quote.author
                        quizViewModel.showResult = true
                    } label: {
                        Text(quote.author)
                            .font(customFont.authorFont)
                            .padding()
                            .frame(width: 150)
                            .background(.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                    }
                }
            }
            else {
                LoadingView()
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        .onAppear(perform: {quizViewModel.loadNewQuote(quote: homeViewModel.quotes)})
        .alert(isPresented: $quizViewModel.showResult) {
            Alert(
                title: Text(quizViewModel.selectedAuthor == quizViewModel.currentQuote.author ? "정답!😆" : "틀렸어요😢"),
                message: Text(quizViewModel.selectedAuthor == quizViewModel.currentQuote.author ? "맞췄어요!" : "A. 해당 명언을 한 인물은 \(quizViewModel.currentQuote.author )입니다."),
                primaryButton: .default(Text("다음"), action: {
                    quizViewModel.loadNewQuote(quote: homeViewModel.quotes)
                }),
                secondaryButton: .default(Text("명언 보기"), action: quizViewModel.showingDetail))
        }
        .sheet(isPresented: $quizViewModel.isShowingDetail, content: {
            QuoteDetailView(quote: $quizViewModel.currentQuote)
        })
    }
}

#Preview {
    QuizView(quizViewModel: QuizViewModel())
        .environmentObject(HomeViewModel())
}
