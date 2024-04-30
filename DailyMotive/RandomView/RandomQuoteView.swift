//
//  RandomQuoteView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI

struct RandomQuoteView: View {
    
    @EnvironmentObject var randomQuoteViewModel: RandomQuoteViewModel
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
                .frame(height: 150)
            
            Image(systemName: "quote.opening")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10){
                if let randomQuote = randomQuoteViewModel.randomQuote() {
                    Text("\(randomQuote.quote)")
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
                    
                    Text("\(randomQuote.author)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                else {
                    Text("N/A")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.bottom, 30)
                    Text("n/a")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                Button {
                    // Likes
                } label: {
                    Image(systemName: "heart") // 사용자가 저장했다면 .fill
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                }
                
                Button {
                    // Share
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 10, trailing: 0))
            
            Button(action: {
                randomQuoteViewModel.updateRandomQuote()
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
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        
        
    }
}

#Preview {
    RandomQuoteView()
        .environmentObject(RandomQuoteViewModel())
}
