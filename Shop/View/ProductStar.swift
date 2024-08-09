// Created by Vlad Lysenka 09.08.2024 

import SwiftUI

struct ProductStar: View {
    var displayType: DisplayType = .list
    var rating: Double = 4.1
    var reviewsAmount: Int = 19
    var body: some View {
        HStack(spacing: 4) {
            Image(.starIcon)
                .font(.system(size: 12))
                .frame(width: 16, height: 16)
            
            Text("\(rating.formatted())")
                .font(.system(size: 12))
                .foregroundStyle(.textIcons001)
            
            if displayType == .list {
                Divider()
                
                Text("\(reviewsAmount) отзывов")
                    .font(.system(size: 12))
                    .foregroundStyle(.textIcons003)
            }
        }
        .frame(height: 16)
    }
}

#Preview {
    ProductStar()
}
