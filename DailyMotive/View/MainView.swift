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
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    //TODO: - ProgressView()
                    Text("로딩 중입니다.")
                }
                else {
                    Spacer()
                    
                    Text("오늘의 명언입니다.")
                        .font(.largeTitle)
                    
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
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            .onAppear {
                viewModel.quoteLoad()
        }
        }
    }
}

#Preview {
    MainView()
}
