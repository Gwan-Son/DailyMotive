//
//  RandomQuoteView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI

struct RandomQuoteView: View {
    
    @EnvironmentObject var quoteModel: QuoteViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Image(systemName: "quote.closing")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10){
                if let randomQuote = quoteModel.randomQuote() {
                    Text("\(randomQuote.quote)")
                        .font(.system(size: 28, weight: .bold))
                        .lineSpacing(12.0)
                        .lineLimit(4)
                        .minimumScaleFactor(0.7)
                        .padding(.bottom, 30)
                    Text("\(randomQuote.author)")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
                else {
                    Text("N/A")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.bottom, 30)
                    Text("n/a")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            Button(action: {
                quoteModel.updateRandomQuote()
            }, label: {
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    Text("다른 명언 보기")
                        .font(.system(size: 20, weight: .bold))
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.pink)
                .cornerRadius(25)
                .foregroundColor(.white)
            })
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        
    }
}

#Preview {
    RandomQuoteView().environmentObject(QuoteViewModel(network: NetworkService(configuration: .default)))
}
