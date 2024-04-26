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
    
    var body: some View {
        TabView(selection: $homeViewModel.selectedTab) {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(Tab.home)
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(Tab.search)
            // FavoriteView()
            Text("Likes")
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

#Preview {
    HomeView()
}
