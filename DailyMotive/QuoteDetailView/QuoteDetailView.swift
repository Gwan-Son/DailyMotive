//
//  QuoteDetailView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/26/24.
//

import SwiftUI

struct QuoteDetailView: View {
    
    @Binding var quote: Quotes
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Image(systemName: "quote.closing")
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
            
            
            HStack(alignment: .center, spacing: 20) {
                Button {
                    // Favorite
                } label: {
                    Image(systemName: "heart") // 사용자가 저장했다면 .fill
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                        .foregroundColor(.gray)
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
            
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))

    }
}

#Preview {
    QuoteDetailView(quote: .constant(Quotes.list[0]))
}
