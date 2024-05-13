//
//  QuoteDetailView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/26/24.
//

import SwiftUI

struct QuoteDetailView: View {
    
    @Binding var quote: Quotes
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    
    private let customFont = FontManager.currentFont()
    
    func renderImage() -> UIImage {
        let renderer = ImageRenderer(content: quoteView.frame(width: 500, height: 400))
        renderer.scale = 2.0
        return renderer.uiImage ?? UIImage()
    }
    
    var quoteView: some View {
        VStack(alignment: .leading, spacing: 10){
            Image(systemName: "quote.opening")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            Text("\(quote.quote)")
                .font(customFont.quoteFont)
                .minimumScaleFactor(0.5)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
                .lineSpacing(12.0)
            
            Rectangle()
                .frame(width: 70, height: 1)
                .foregroundColor(.gray)
                .padding(.top, 40)
            
            Text("\(quote.author)")
                .font(customFont.authorFont)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer()
            
//            VStack(alignment: .leading, spacing: 10){
//                Image(systemName: "quote.opening")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(.gray)
//                Text("\(quote.quote)")
//                    .font(customFont.quoteFont)
//                    .minimumScaleFactor(0.5)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .lineLimit(nil)
//                    .lineSpacing(12.0)
//                
//                Rectangle()
//                    .frame(width: 70, height: 1)
//                    .foregroundColor(.gray)
//                    .padding(.top, 40)
//                
//                Text("\(quote.author)")
//                    .font(customFont.authorFont)
//                    .foregroundColor(.gray)
//                    .padding(.top, 5)
//            }
            
            quoteView
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 20) {
                Button {
                    // Likes
                    if !likesQuoteViewModel.likesQuoteList.contains(quote) {
                        likesQuoteViewModel.addQuote(with: quote)
                    } else {
                        // unlike
                        likesQuoteViewModel.deleteQuote(with: quote)
                    }
                } label: {
                    if !likesQuoteViewModel.likesQuoteList.contains(quote) {
                        Image(systemName: "heart") // 사용자가 저장 안함
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "heart.fill") // 사용자가 저장함
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                    }
                }
                    
                // 텍스트 공유 기능
                ShareLink(item: String(quote.quote + "\n-" + quote.author + "-")) {
                    Image(systemName: "square.and.arrow.up")
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
                
                // 이미지 공유 기능
                ShareLink(item: Image(uiImage: renderImage()), preview: SharePreview(quote.quote, image: Image(uiImage: renderImage()))) {
                    Image(systemName: "square.and.arrow.up")
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30))
    }
}

#Preview {
    QuoteDetailView(quote: .constant(Quotes.list[0]))
        .environmentObject(LikesViewModel())
}
