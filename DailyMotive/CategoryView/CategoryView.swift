//
//  CategoryView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import SwiftUI
import Combine

struct CategoryView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    private let customFont = FontManager.currentFont()
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                ScrollView{
                    LazyVGrid(columns: layout) {
                        ForEach($homeViewModel.category) { $cate in
                            NavigationLink {
                                let vm = QuoteViewModel(quotes: homeViewModel.quotes)
                                QuoteListView(quoteViewModel: vm,category: $cate)
                            } label: {
                                CategoryCell(category: $cate)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("카테고리")
                        .font(customFont.buttonFont)
                        .accessibilityAddTraits(.isHeader)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

#Preview {
    CategoryView()
        .environmentObject(HomeViewModel())
}
