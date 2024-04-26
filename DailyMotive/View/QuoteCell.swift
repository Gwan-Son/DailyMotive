//
//  QuoteCell.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/26/24.
//

import SwiftUI

struct QuoteCell: View {
    
    @Binding var quotes: Quotes
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 10) {
                Text("\(quotes.quote)")
                    .font(.title3)
                    .lineLimit(2)
                Text("\(quotes.author)")
                    .font(.caption)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.black)
            .cornerRadius(10)
        }
    }
}

#Preview {
    QuoteCell(quotes: .constant(Quotes.list[0]))
}
