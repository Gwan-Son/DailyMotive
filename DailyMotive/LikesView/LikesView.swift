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
        VStack {
            Text("총 개수: 0")
            Spacer()
                .frame(height: 50)
            
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

#Preview {
    LikesView()
        .environmentObject(LikesViewModel())
}
