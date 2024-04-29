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
                                let vm = CategoryQuoteViewModel(quotes: homeViewModel.quotes)
                                CategoryDetailView(categoryQuoteViewModel: vm,category: $cate)
                            } label: {
                                CategoryCell(category: $cate)
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                Spacer()
                
                
            }
            .navigationTitle("오늘의 명언")
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        }
    }
}

#Preview {
    CategoryView()
        .environmentObject(HomeViewModel())
}
