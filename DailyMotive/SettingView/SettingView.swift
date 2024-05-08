//
//  SettingView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/2/24.
//

import SwiftUI
import MessageUI

struct SettingView: View {
    
    @State private var customFont = FontManager.currentFont()
    @State private var isShowingResetAlert = false // 초기화 Alert
    @State private var isSendingMail = false // 문의하기 메일 Alert
    @State private var isCantSendingMail = false // 메일 설정 Alert
    @StateObject var settingViewModel = SettingViewModel()
    @EnvironmentObject var likesViewModel: LikesViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section("설정") {
                    Text("알림 설정")
//                    Text("테마 변경")
                    NavigationLink {
                        FontView(settingViewModel: settingViewModel, customFont: $customFont)
                    } label: {
                        Text("글씨체 변경")
                    }
                }
                
                Section("지원") {
                    Text("공지사항")
                    
                    if MFMailComposeViewController.canSendMail() {
                        NavigationLink {
                            
                        } label: {
                            Text("문의하기")
//                            isSendingMail = true
                        }

                    } else {
                        ZStack(alignment: .leading) {
                            NavigationLink{
                                
                            } label: {
                                
                            }
                            Button {
                                
//                                isCantSendingMail = true
                            } label: {
                                Text("문의하기")
                                    .foregroundColor(.black)
                            }
                        }
                        
                    }
                }
                .sheet(isPresented: $isSendingMail, content: {
                    MailView()
                })
                
                
                Section("사용자") {
                    
                    Button {
                        isShowingResetAlert = true
                    } label: {
                        Text("초기화")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $isShowingResetAlert) {
                        Alert(
                            title: Text("초기화"),
                            message: Text("저장된 명언을 초기화하시겠습니까?"),
                            primaryButton: .default(Text("아니요")),
                            secondaryButton: .destructive(Text("초기화"), action: {
                                likesViewModel.resetQuote()
                                homeViewModel.selectedTab = .home
                            }))
                    }
                    
                    
                }
                
            }
            .alert(isPresented: $isCantSendingMail) {
                Alert(
                    title: Text("메일 활성화"),
                    message: Text("Mail 앱에서 사용자의 Email을 설정해주세요."),
                    dismissButton: .default(Text("확인"), action: {
                        guard let mailSettingURL = URL(string: UIApplication.openSettingsURLString + "&path=MAIL") else { return }
                        if UIApplication.shared.canOpenURL(mailSettingURL) {
                            UIApplication.shared.open(mailSettingURL, options: [:], completionHandler: nil)
                        }
                    })
                    
                )
            }
            .background(.bar)
            .scrollContentBackground(.hidden)
            .font(customFont.authorFont)
        }
        
    }
}

#Preview {
    SettingView(settingViewModel: SettingViewModel(), homeViewModel: HomeViewModel())
        .environmentObject(LikesViewModel())
}
