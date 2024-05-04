//
//  FontView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/4/24.
//

import SwiftUI

struct FontView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var customFont: Fonts
    
    let name = ["애플기본", "런드리고딕", "영주선비체", "강원교육모두Light", "산하엽", "부크크명조 얇은글씨", "온글잎 매일옥자체"]
    let data = ["AppleSDGothicNeo-Regular", "OTLaundryGothicR", "YEONGJUSeonbi", "GangwonEduAll-OTFLight", "Diphylleia-Regular", "BookkMyungjo-Lt", "Ownglyph_Dailyokja-Rg"]
    let value: [Fonts] = [.apple, .laundry, .sunbi, .gwonAll, .diphy, .bkkLT, .dailyOJ]
    
    
    @State private var selectedFont = "OTLaundryGothicR"
    
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                Text("뒤로가기")
                    .font(customFont.buttonFont)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            // Font 미리보기 View
            List {
                Section(header: Text("폰트")) {
                    ForEach(Array(name.enumerated()), id: \.element) {index, fontName in
                        ZStack(alignment: .leading) {
                            Button {
                                customFont = value[index]
                                print("선택된 폰트: \(fontName)")
                                selectedFont = fontName
                                //viewModel에서 FontManager.applyFont
                                FontManager.applyFont(font: customFont)
                            } label: {
                                
                            }
                            HStack {
                                Text(fontName)
                                    .font(.custom(data[index], size: 14))
                                if customFont == value[index] {
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .renderingMode(.original)
                                }
                            }
                        }
                    }
                }
            }
            // Font 리스트
            .background(.bar)
            .scrollContentBackground(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
//        .navigationTitle("글씨체 설정")
    }
    
}

#Preview {
    FontView(customFont: .constant(.gwonAll))
}
