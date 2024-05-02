//
//  QuoteDetailView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/26/24.
//

import SwiftUI

struct QuoteDetailView: View {
    
    @Binding var quote: Quotes
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer()
                .frame(height: 130)
            
            Image(systemName: "quote.opening")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10){
                Text("\(quote.quote)")
                    .font(.callout)
                    .bold()
                    .minimumScaleFactor(0.5)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .lineSpacing(12.0)
                
                Rectangle()
                    .frame(width: 70, height: 1)
                    .foregroundColor(.gray)
                    .padding(.top, 40)
                
                Text("\(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                Button {
                    // Likes
                    if !likesQuoteViewModel.likesQuoteList.contains(quote) {
                        likesQuoteViewModel.addQuote(with: quote)
                    } else {
                        // unlike
                        likesQuoteViewModel.deleteQuote(with: quote)
                    }
                } label: {
                    if !likesQuoteViewModel.likesQuoteList.contains(quote) {
                        Image(systemName: "heart") // 사용자가 저장 안함
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "heart.fill") // 사용자가 저장함
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                }
                
                Button {
                    // Share
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
    }
}

#Preview {
    QuoteDetailView(quote: .constant(Quotes.list[0]))
        .environmentObject(LikesViewModel())
}
