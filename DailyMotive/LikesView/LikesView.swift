//
//  LikesView.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/30/24.
//

import SwiftUI

struct LikesView: View {
    
    @EnvironmentObject var likesQuoteViewModel: LikesViewModel
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                Text("Likes")
                ForEach(likesQuoteViewModel.likesQuoteList) { quote in
                    Text("\(quote.quote)")
                    Text("\(quote.author)")
                }
                
            }
        }
    }
}

#Preview {
    LikesView()
        .environmentObject(LikesViewModel())
}
