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
    @State private var isCantSendingMail = false // 메일 설정 Alert
    
    private let mailComposeDelegate = MailDelegate()
    
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
                    NavigationLink {
                        NoticeView()
                    } label: {
                        Text("공지사항")
                    }
                    
                    if MFMailComposeViewController.canSendMail() {
                        ZStack(alignment: .leading) {
                            Button {
                                self.presentMailCompose()
                            } label: {
                                
                            }
                            HStack {
                                Text("문의하기")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.gray)
                            }
                        }
                    } else {
                        ZStack(alignment: .leading) {
                            Button {
                                // cantSendMail
                                isCantSendingMail.toggle()
                            } label: {
                                
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
                            HStack {
                                Text("문의하기")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.gray)
                            }
                            
                        }
                    }
                    HStack {
                        Text("앱버전")
                        Spacer()
                        Text(AppVersion.getAppVersion())
                            .foregroundColor(.gray)
                    }
                }
                
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
            .background(.bar)
            .scrollContentBackground(.hidden)
            .font(customFont.authorFont)
        }
        
    }
}

// 메일 UIKit + SwiftUI
extension SettingView {
    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            // DEBUG
            //               switch result {
            //               case .sent:
            //                   print("메일 보내기 성공")
            //               case .cancelled:
            //                   print("메일 보내기 취소")
            //               case .saved:
            //                   print("메일 임시 저장")
            //               case .failed:
            //                   print("메일 발송 실패")
            //               @unknown default: break
            //               }
            
            
            controller.dismiss(animated: true)
        }
        
    }
    
    /// Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate
        
        let bodyString = "이곳에 내용을 작성해 주세요."
        
        composeVC.setToRecipients(["id1593572580@gmail.com"])
        composeVC.setSubject("문의 사항")
        composeVC.setMessageBody(bodyString, isHTML: false)
        
        vc?.present(composeVC, animated: true)
    }
}

#Preview {
    SettingView(settingViewModel: SettingViewModel(), homeViewModel: HomeViewModel())
        .environmentObject(LikesViewModel())
}
