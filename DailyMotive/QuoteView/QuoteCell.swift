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
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 10) {
                Text("\(quotes.quote)")
                    .font(.caption)
                    .bold()
                    .lineLimit(3)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Text("\(quotes.author)")
                    .font(.caption2)
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
