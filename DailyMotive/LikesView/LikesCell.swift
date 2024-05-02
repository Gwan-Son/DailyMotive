//
//  LikesCell.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/2/24.
//

import SwiftUI

struct LikesCell: View {
    
    @Binding var quotes: Quotes
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 10) {
                Text("\(quotes.quote)")
                    .font(.title3)
                    .bold()
                    .lineLimit(2)
                Text("\(quotes.author)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.regularMaterial)
            .cornerRadius(10)
        }
    }
}

#Preview {
    LikesCell(quotes: .constant(Quotes.list[0]))
}
