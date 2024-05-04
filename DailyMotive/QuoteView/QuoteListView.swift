//
//  CategoryView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI
import Combine

struct QuoteListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var quoteViewModel: QuoteViewModel
    
    @Binding var category: Category
    
    @State var cateQuotes: [Quotes] = []
    
    private let customFont = FontManager.currentFont()
    
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                Text("뒤로가기")
                    .font(customFont.buttonFont)
            }
        }
    }
    
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
                    .padding(.bottom, 3)
                }
            }
            .padding(.top, 10)
        }
        .sheet(isPresented: $quoteViewModel.isShowingDetailView, content: {
            NavigationView {
                QuoteDetailView(quote: $quoteViewModel.selectedQuote)
            }
        })
        .scrollIndicators(.hidden)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationTitle(category.name)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onAppear {
            cateQuotes = quoteViewModel.filterQuotes(for: category)
        }
    }
}

#Preview {
    QuoteListView(quoteViewModel: QuoteViewModel(quotes: Quotes.list), category: .constant(Category.list[0]))
}
