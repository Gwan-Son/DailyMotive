//
//  MainView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @StateObject var viewModel: QuoteViewModel = QuoteViewModel(network: NetworkService(configuration: .default))
    
    var subscription = Set<AnyCancellable>()
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    //TODO: - ProgressView()
                    Text("로딩 중입니다.")
                }
                else {
                    Spacer()
                    
                    ScrollView{
                        LazyVGrid(columns: layout) {
                            ForEach($viewModel.category) { $cate in
                                NavigationLink {
                                    CategoryView(category: $cate)
                                        .environmentObject(viewModel)
                                } label: {
                                    CategoryCell(category: $cate)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        RandomQuoteView()
                            .environmentObject(viewModel)
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
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        }
    }
}

#Preview {
    MainView()
}
