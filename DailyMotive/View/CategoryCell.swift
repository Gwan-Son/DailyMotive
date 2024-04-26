//
//  CategoryCell.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/23/24.
//

import SwiftUI

struct CategoryCell: View {
    
    @Binding var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [backgroundColor(for: category.id - 1), backgroundColor(for: category.id)]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .frame(maxWidth: .infinity, minHeight: 100)
            
            Image(category.imageName(id: category.id))
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .opacity(0.3)
                .cornerRadius(20)
            
            Text(category.name)
                .font(.largeTitle)
                .bold()
//                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
        }
    }
    
    func backgroundColor(for intValue: Int) -> Color {
        switch intValue {
        case 0:
            return .white
        case 1:
            return .red
        case 2:
            return .blue
        case 3:
            return .green
        case 4:
            return .yellow
        case 5:
            return .orange
        case 6:
            return .purple
        case 7:
            return .pink
        case 8:
            return .gray
        case 9:
            return .black
        case 10:
            return .indigo
        case 11:
            return .cyan
        case 12:
            return .brown
        default:
            return .clear
        }
    }
}

#Preview {
    CategoryCell(category:.constant(Category.list[0]))
}
