//
//  CategoryView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI
import Combine

struct QuoteListView: View {
    
    @StateObject var quoteViewModel: QuoteViewModel
    
    @Binding var category: Category
    
    @State var cateQuotes: [Quotes] = []
    
    let layout: [GridItem] = [
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach($cateQuotes) { $quote in
                    Button {
                        quoteViewModel.selectedQuote = quote
                        quoteViewModel.isShowingDetailView = true
                    } label: {
                        QuoteCell(quotes: $quote)
                    }
                }
                .padding(.bottom, 10)
            }
        }
        .sheet(isPresented: $quoteViewModel.isShowingDetailView, content: {
            NavigationView {
                QuoteDetailView(quote: $quoteViewModel.selectedQuote)
            }
        })
        .scrollIndicators(.hidden)
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .navigationTitle(category.name)
        .onAppear {
            cateQuotes = quoteViewModel.filterQuotes(for: category)
        }
    }
}

#Preview {
    QuoteListView(quoteViewModel: QuoteViewModel(quotes: Quotes.list), category: .constant(Category.list[0]))
}
