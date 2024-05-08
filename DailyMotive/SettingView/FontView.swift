//
//  FontView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/4/24.
//

import SwiftUI

struct FontView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var settingViewModel: SettingViewModel
    @Binding var customFont: Fonts
    
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
                Section(header: Text("미리보기").font(customFont.authorFont)) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("강렬한 사랑은 판단하지 않는다. 주기만 할 뿐이다.")
                            .font(customFont.quoteFont)
                            .padding(.top, 10)
                        Spacer()
                        Rectangle()
                            .frame(width: 70, height: 1)
                            .foregroundColor(.gray)
                        Text("마더 테레사")
                            .font(customFont.authorFont)
                            .padding(.bottom, 10)
                    }
                }
                
                
                Section(header: Text("폰트").font(customFont.authorFont)) {
                    ForEach(Array(settingViewModel.name.enumerated()), id: \.element) {index, fontName in
                        ZStack(alignment: .leading) {
                            Button {
                                customFont = settingViewModel.changeFont(index: index)
                            } label: {
                                
                            }
                            HStack {
                                Text(fontName)
                                    .font(settingViewModel.showFont(index: index))
                                if customFont == settingViewModel.value[index] {
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .renderingMode(.original)
                                }
                            }
                        }
                    }
                }
            }
            .background(.bar)
            .scrollContentBackground(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("글씨체 변경")
                    .font(customFont.buttonFont)
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
    
}

#Preview {
    FontView(settingViewModel: SettingViewModel(), customFont: .constant(.gwonAll))
}
