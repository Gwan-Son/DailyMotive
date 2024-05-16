//
//  SplashView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/16/24.
//

import SwiftUI

struct SplashView: View {
    private let customFont = FontManager.currentFont()
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 15) {
                Text("필담")
                    .font(customFont.categoryCellFont)
                Text("당신과 마음의 의사소통")
                    .font(customFont.quoteFont)
            }
            
        }
    }
}

#Preview {
    SplashView()
}
