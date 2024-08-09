// Created by Vlad Lysenka 09.08.2024 

import SwiftUI

struct ProductImage: View {
    var image: String = "product0"
    var size: CGFloat = 144
    var priceSale: PriceSale? = .cardPrice
    var discount: Int? = 25
    var displayType: DisplayType = .grid
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(.rect(cornerRadius: displayType == .grid ? 20 : 0))
            .overlay(alignment: .topLeading) {
                if let sale = priceSale {
                    Text(sale.rawValue)
                        .font(.system(size: 10, weight: .regular))
                        .foregroundStyle(.textStatic001)
                        .padding(EdgeInsets(top: 2, leading: 12, bottom: 4, trailing: 6))
                        .background(priceSale == .hitPrice ? .hitPrice : .newProduct, in: .rect(topLeadingRadius: displayType == .grid ? 20 : 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
                }
            }
            .overlay(alignment: .bottomTrailing) {
                if let discount {
                    Text("\(discount)%")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(.additional004)
                }
            }
    }
}

#Preview {
    ProductImage()
}
