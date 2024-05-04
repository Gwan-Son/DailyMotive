//
//  FontView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/4/24.
//

import SwiftUI

struct FontView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var customFont = FontManager.currentFont()
    
    let data = ["런드리", "고딕", "나눔"]
    
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
                    ForEach((0...10), id: \.self) { index in
                        NavigationLink {
                            secondView(index: index)
                        } label: {
                            Text("\(index)")
                        }

                            
                    }
                }
            }
            // Font 리스트
//            Form {
//                Section("글씨체") {
//                    Text("1")
//                    Text("1")
//                    Text("1")
//                    Text("1")
//                    Text("1")
//                }
//            }
            .background(.bar)
            .scrollContentBackground(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("글씨체 설정")
    }
    
    // DEBUG
    func secondView(index: Int) -> some View {
            var body: some View {
                Text("\(index)")
            }
            
            return body
        }
}

#Preview {
    FontView()
}
