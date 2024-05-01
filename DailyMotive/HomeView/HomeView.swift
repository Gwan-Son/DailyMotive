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
    @StateObject var likesQuoteViewModel: LikesViewModel = LikesViewModel()
    
    var body: some View {
        if homeViewModel.isLoading {
            LoadingView()
        }
        else {
            TabView(selection: $homeViewModel.selectedTab) {
                RandomQuoteView()
                    .environmentObject(homeViewModel.randomQuoteViewModel)
                    .environmentObject(likesQuoteViewModel)
                    .tabItem {
                        Image(systemName: "quote.bubble")
                        Text("Quote")
                    }
                    .tag(Tab.home)
                CategoryView()
                    .environmentObject(homeViewModel)
                    .environmentObject(likesQuoteViewModel)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(Tab.search)
                // LikesView()
                LikesView()
                    .environmentObject(likesQuoteViewModel)
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Likes")
                    }
                    .tag(Tab.likes)
                
                // SettingView()
                Text("Setting")
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Setting")
                    }
                    .tag(Tab.setting)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}
