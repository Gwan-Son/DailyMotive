//
//  SettingView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/2/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("설정") {
                    Text("1")
                    Text("1")
                    Text("1")
                }
                
                Section("2") {
                    Text("2")
                    Text("2")
                    Text("2")
                }
            }
            
            .navigationTitle("설정")
        }
        
    }
}

#Preview {
    SettingView()
}
