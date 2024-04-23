//
//  CategoryView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI
import Combine

struct CategoryView: View {
    
    @EnvironmentObject var quoteModel: QuoteViewModel
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
            cateQuotes = quoteModel.filterQuotes(for: category)
        }
    }
}

#Preview {
    CategoryView(category: .constant(Category.list[0])).environmentObject(QuoteViewModel(network: NetworkService(configuration: .default)))
}
