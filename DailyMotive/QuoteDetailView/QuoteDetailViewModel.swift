//
//  QuoteDetailViewModel.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/10/24.
//

import SwiftUI

final class QuoteDetailViewModel: ObservableObject {
    
    private let customFont = FontManager.currentFont()
    
    func shareQuote(_ quote: String,_ author: String) {
        let image = generateImage(quote: quote, author: author)
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    func generateImage(quote: String, author: String) -> UIImage {
        let view = VStack(alignment: .leading, spacing: 20) {
            Image(systemName: "quote.opening")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            VStack(alignment: .leading, spacing: 10){
                Text(quote)
                    .font(customFont.quoteFont)
                    .minimumScaleFactor(0.5)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .lineSpacing(12.0)
                
                Rectangle()
                    .frame(width: 70, height: 1)
                    .foregroundColor(.gray)
                    .padding(.top, 40)
                
                Text(author)
                    .font(customFont.authorFont)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
            }
        }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 400, height: 500)
            .background(Color.white)
            .padding()
        
        let image = view.convertViewToImage()
        return image
    }
}

extension View {
    func convertViewToImage( ) -> UIImage {

        let view = UIHostingController(rootView: self)
        let size = view.view.bounds.size
        view.view.frame = CGRect(origin: .zero, size: size)
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            view.view.layer.render(in: context.cgContext)
        }
        return image
    }
}
