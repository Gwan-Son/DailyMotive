//
//  SettingView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/2/24.
//

import SwiftUI

struct SettingView: View {
    
    @State private var customFont = FontManager.currentFont()
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font : customFont.categoryFont]
//    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("설정") {
                    Text("알림 설정")
                    Text("테마 변경")
                    NavigationLink {
                        FontView(customFont: $customFont)
                    } label: {
                        Text("글씨체 변경")
                    }

                }
                
                
                
                Section("지원") {
                    Text("공지사항")
                    Text("문의하기")
                    Text("개인정보처리방침")
                }
                
                Section("사용자") {
                    Text("초기화")
                        .foregroundColor(.red)
                }
            }
            .background(.bar)
            .scrollContentBackground(.hidden)
            .font(customFont.authorFont)
//            .navigationTitle("설정")
        }
        
    }
}

#Preview {
    SettingView()
}
