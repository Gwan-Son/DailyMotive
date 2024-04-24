//
//  CategoryView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI
import Combine

struct CategoryView: View {
    
//    @EnvironmentObject var quoteModel: QuoteViewModel
    
    @StateObject var categoryQuoteViewModel: CategoryQuoteViewModel
    
    @Binding var category: Category
    
    @State var cateQuotes: [Quotes] = []
    
    var body: some View {
        ScrollView {
            ForEach(cateQuotes) { quote in
                Text(quote.quote)
                    .font(.system(size: 18, weight: .bold))
                Text(quote.author)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(category.name)
        .onAppear {
            cateQuotes = categoryQuoteViewModel.filterQuotes(for: category)
        }
    }
}

#Preview {
    CategoryView(categoryQuoteViewModel: CategoryQuoteViewModel(quotes: Quotes.list), category: .constant(Category.list[0]))
}
