//
//  DailyMotiveApp.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/22/24.
//

import SwiftUI

@main
struct DailyMotiveApp: App {
    
    @StateObject var likeViewModel = LikesViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(likeViewModel)
        }
    }
}
