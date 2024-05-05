//
//  LikesView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/30/24.
//

import SwiftUI

struct LikesView: View {
    
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    
    private let customFont = FontManager.currentFont()
    
    let layout: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                if likesQuoteViewModel.likesQuoteList.isEmpty {
                    Spacer()
                    Text("저장된 명언이 없습니다.")
                        .font(customFont.quoteFont)
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
                            .padding(.bottom, 3)
                        })
                    }
                    .padding(.top, 10)
                    .sheet(isPresented: $likesQuoteViewModel.isShowingLikesView, content: {
                        NavigationView {
                            QuoteDetailView(quote: $likesQuoteViewModel.selectedQuote)
                        }
                    })
                    .scrollIndicators(.hidden)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("저장된 명언")
                        .font(customFont.buttonFont)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

#Preview {
    LikesView()
        .environmentObject(LikesViewModel())
}
