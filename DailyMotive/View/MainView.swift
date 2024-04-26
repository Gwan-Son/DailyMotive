//
//  HomeView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/24/24.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @StateObject var viewModel: QuoteViewModel = QuoteViewModel(network: NetworkService(configuration: .default))
    
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                }
                else {
                    Spacer()
                    
                    ScrollView{
                        LazyVGrid(columns: layout) {
                            ForEach($viewModel.category) { $cate in
                                NavigationLink {
                                    let vm = CategoryQuoteViewModel(quotes: viewModel.quotes)
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
                    
                    NavigationLink {
                        let vm = RandomQuoteViewModel(quotes: viewModel.quotes)
                        RandomQuoteView(randomQuoteViewModel: vm)
                    } label: {
                        Text("랜덤 명언")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(.pink)
                            .cornerRadius(25)
                    }
                    
                    Spacer()
                }
                
            }
            .navigationTitle("오늘의 명언")
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        }
    }
}

#Preview {
    MainView(viewModel: QuoteViewModel(network: NetworkService(configuration: .default)))
}
