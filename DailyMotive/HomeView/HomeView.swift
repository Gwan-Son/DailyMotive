//
//  MainView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    @State var isLaunching: Bool = true
    
    var body: some View {
        if isLaunching {
            SplashView()
                .opacity(isLaunching ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeIn(duration: 1)) {
                            isLaunching = false
                        }
                    }
                }
        } else {
            if homeViewModel.isLoading {
                LoadingView()
            }
            else {
                
                TabView(selection: $homeViewModel.selectedTab) {
                    RandomQuoteView()
                        .environmentObject(homeViewModel.randomQuoteViewModel)
                        .tabItem {
                            Image(systemName: "quote.bubble")
                        }
                        .tag(Tab.home)
                    QuizView()
                        .environmentObject(homeViewModel)
                        .tabItem {
                            Image(systemName: "questionmark.bubble")
                        }
                        .tag(Tab.quiz)
                    CategoryView()
                        .environmentObject(homeViewModel)
                        .tabItem {
                            Image(systemName: "folder")
                        }
                        .tag(Tab.search)
                    LikesView()
                        .tabItem {
                            Image(systemName: "heart")
                        }
                        .tag(Tab.likes)
                    
                    SettingView(homeViewModel: homeViewModel)
                        .tabItem {
                            Image(systemName: "gearshape")
                        }
                        .tag(Tab.setting)
                }
                .accentColor(.pink)
                
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(LikesViewModel())
}
