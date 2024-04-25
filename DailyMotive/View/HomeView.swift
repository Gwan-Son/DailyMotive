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
            
            // FavoriteView()
            Text("cc")
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorite")
                }
                .tag(Tab.favorite)
            
            // SettingView()
            Text("dd")
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
