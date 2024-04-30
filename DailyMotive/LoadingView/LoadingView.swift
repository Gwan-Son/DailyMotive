//
//  LoadingView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/26/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ProgressView()
            Text("명언을 가져오는 중입니다...")
        }
    }
}

#Preview {
    LoadingView()
}
