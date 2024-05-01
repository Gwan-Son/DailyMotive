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
        VStack {
            QuoteDetailView(quote: $randomQuoteViewModel.currentQuote)
            
            Button(action: {
                randomQuoteViewModel.randomQuote()
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
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        }
        
        
        
        
        //        VStack(alignment: .leading, spacing: 20) {
        //
        //            Spacer()
        //                .frame(height: 150)
        //
        //            Image(systemName: "quote.opening")
        //                .resizable()
        //                .scaledToFit()
        //                .frame(width: 50, height: 50)
        //                .foregroundColor(.gray)
        //
        //            VStack(alignment: .leading, spacing: 10){
        //
        //                Text("\(randomQuoteViewModel.currentQuote!.quote)")
        //                    .font(.callout)
        //                    .bold()
        //                    .minimumScaleFactor(0.5)
        //                    .fixedSize(horizontal: false, vertical: true)
        //                    .lineLimit(nil)
        //                    .lineSpacing(12.0)
        //
        //                Rectangle()
        //                    .frame(width: 70, height: 1)
        //                    .foregroundColor(.gray)
        //                    .padding(.top, 40)
        //
        //                Text("\(randomQuoteViewModel.currentQuote!.author)")
        //                    .font(.subheadline)
        //                    .foregroundColor(.gray)
        //                    .padding(.top, 5)
        //
        //
        //            }
        //
        //            Spacer()
        //
        //            HStack(alignment: .center, spacing: 20) {
        //                Button {
        //                    // Likes
        //                    if !likesQuoteViewModel.likesQuoteList.contains(randomQuoteViewModel.currentQuote!) {
        //                        likesQuoteViewModel.addQuote(with: randomQuoteViewModel.currentQuote!)
        //                    } else {
        //                        // unlike
        //                        likesQuoteViewModel.deleteQuote(with: randomQuoteViewModel.currentQuote!)
        //                    }
        //                } label: {
        //                    if !likesQuoteViewModel.likesQuoteList.contains(randomQuoteViewModel.currentQuote!) {
        //                        Image(systemName: "heart") // 사용자가 저장 안함
        //                            .resizable()
        //                            .scaledToFill()
        //                            .frame(width: 30, height: 30)
        //                            .foregroundColor(.gray)
        //                    } else {
        //                        Image(systemName: "heart.fill") // 사용자가 저장함
        //                            .resizable()
        //                            .scaledToFill()
        //                            .frame(width: 30, height: 30)
        //                    }
        //                }
        //
        //                Button {
        //                    // Share
        //                } label: {
        //                    Image(systemName: "square.and.arrow.up")
        //                        .resizable()
        //                        .scaledToFill()
        //                        .frame(width: 30, height: 30)
        //                        .foregroundColor(.gray)
        //                }
        //            }
        //            .frame(maxWidth: .infinity)
        //            .padding(EdgeInsets(top: 50, leading: 0, bottom: 10, trailing: 0))
        //
        //            Button(action: {
        //                randomQuoteViewModel.randomQuote()
        //            }, label: {
        //                HStack {
        //                    Image(systemName: "arrow.triangle.2.circlepath")
        //                    Text("다른 명언 보기")
        //                        .font(.system(size: 20, weight: .bold))
        //                }
        //                .frame(maxWidth: .infinity, minHeight: 50)
        //                .background(.pink)
        //                .cornerRadius(25)
        //                .foregroundColor(.white)
        //            })
        //        }
        //        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        
        
    }
}

#Preview {
    RandomQuoteView()
        .environmentObject(RandomQuoteViewModel())
        .environmentObject(LikesViewModel())
}
