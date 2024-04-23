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
        HStack {
            Text(category.name)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(backgroundColor(for: category.id))
                .cornerRadius(20)
        }
    }
    
    func backgroundColor(for intValue: Int) -> Color {
            switch intValue {
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
                return .white
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
