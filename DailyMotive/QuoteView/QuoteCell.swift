//
//  QuoteCell.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/26/24.
//

import SwiftUI

struct QuoteCell: View {
    
    @Binding var quotes: Quotes
    
    @Environment(\.colorScheme) var colorScheme
    
    private let customFont = FontManager.currentFont()
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 10) {
                Text("\(quotes.quote)")
                    .font(customFont.cellFont)
                    .bold()
                    .lineLimit(3)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Text("\(quotes.author)")
                    .font(customFont.cellFont)
                    .foregroundColor(.gray)
            }
//            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//            .foregroundColor(.black)
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(.regularMaterial)
            .cornerRadius(10)
        }
    }
}

#Preview {
    QuoteCell(quotes: .constant(Quotes.list[0]))
}
