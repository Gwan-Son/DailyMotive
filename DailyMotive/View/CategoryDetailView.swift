//
//  CategoryView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI
import Combine

struct CategoryDetailView: View {
    
//    @EnvironmentObject var quoteModel: QuoteViewModel
    
    @StateObject var categoryQuoteViewModel: CategoryQuoteViewModel
    
    @Binding var category: Category
    
    @State var cateQuotes: [Quotes] = []
    
    let layout: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach($cateQuotes) { $quote in
                    NavigationLink {
                        QuoteDetailView(quote: $quote)
                    } label: {
                        QuoteCell(quotes: $quote)
                    }

                }
                .padding(.bottom, 10)
            }
        }
        .scrollIndicators(.hidden)
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .navigationTitle(category.name)
        .onAppear {
            cateQuotes = categoryQuoteViewModel.filterQuotes(for: category)
        }
    }
}

#Preview {
    CategoryDetailView(categoryQuoteViewModel: CategoryQuoteViewModel(quotes: Quotes.list), category: .constant(Category.list[0]))
}
