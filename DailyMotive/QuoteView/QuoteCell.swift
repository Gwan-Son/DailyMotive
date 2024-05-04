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
        
            
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                    .frame(height: 0)
                    .frame(maxWidth: .infinity)
                Text("\(quotes.quote)")
                    .font(customFont.authorFont)
                    .lineLimit(1)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Text("\(quotes.author)")
                    .font(customFont.authorFont)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 0)
                    .frame(maxWidth: .infinity)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//            .foregroundColor(.black)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.regularMaterial)
            .cornerRadius(10)
            
        
        
    }
}

#Preview {
    QuoteCell(quotes: .constant(Quotes.list[0]))
}
