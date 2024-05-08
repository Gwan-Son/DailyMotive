//
//  MailView.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/8/24.
//

import SwiftUI
import MessageUI

struct MailView : UIViewControllerRepresentable{
    
    let bodyString = "이곳에 내용을 작성해 주세요."
    
    typealias UIViewControllerType = MFMailComposeViewController
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        if MFMailComposeViewController.canSendMail(){
            let view = MFMailComposeViewController()
            view.mailComposeDelegate = context.coordinator
            view.setToRecipients(["id1593572580@gmail.com"])
            view.setSubject("Daily Motive 문의사항")
            view.setMessageBody(bodyString, isHTML: false)
            return view
        } else {
            return MFMailComposeViewController()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    class Coordinator : NSObject, MFMailComposeViewControllerDelegate{
        
        var parent : MailView
        
        init(_ parent: MailView){
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
        
       
    }
    
    
}
