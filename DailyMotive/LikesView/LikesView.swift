//
//  LikesView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/30/24.
//

import SwiftUI

struct LikesView: View {
    
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            Text("저장된 명언")
                .font(.title)
                .bold()
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
            
            
            Spacer()
            
            if likesQuoteViewModel.likesQuoteList.isEmpty {
                Text("저장된 명언이 없습니다.")
                    .font(.callout)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            else {
                ScrollView {
                    
                    LazyVGrid(columns: layout, content: {
                        ForEach($likesQuoteViewModel.likesQuoteList) { $quote in
                            Button {
                                likesQuoteViewModel.selectedQuote = quote
                                likesQuoteViewModel.isShowingLikesView = true
                            } label: {
                                LikesCell(quotes: $quote)
                            }
                        }
                        .padding(.bottom, 10)
                    })
                }
                .sheet(isPresented: $likesQuoteViewModel.isShowingLikesView, content: {
                    NavigationView {
                        QuoteDetailView(quote: $likesQuoteViewModel.selectedQuote)
                    }
                })
                .scrollIndicators(.hidden)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
    }
}

#Preview {
    LikesView()
        .environmentObject(LikesViewModel())
}
