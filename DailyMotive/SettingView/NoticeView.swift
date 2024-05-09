//
//  NotiveView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/9/24.
//

import SwiftUI

struct NoticeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let customFont = FontManager.currentFont()
    private let noticeTitle = "< 공지사항 >"
    private let noticeText = """
                            안녕하세요. 개발자 관슨입니다.
                            불편한 점이나 개선되었으면 하는 점이 있다면
                            [문의하기]를 통해 알려주세요.
                            최대한 빠른 시일 내에 답장 드리겠습니다.
                            아직 미숙한 부분이 많은 개발자라
                            다소 시간이 걸리더라도 양해 부탁드립니다.
                            """
    
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
            Form {
                Text(noticeTitle)
                    .font(customFont.buttonFont)
                    .frame(maxWidth: .infinity)
                Text(noticeText)
                    .font(customFont.quoteFont)
                    .lineSpacing(10.0)
            }
            .background(.bar)
            .scrollContentBackground(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("공지사항")
                    .font(customFont.buttonFont)
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
}

#Preview {
    NoticeView()
}
