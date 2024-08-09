// Created by Vlad Lysenka 09.08.2024

import SwiftUI

struct ProductCard: View {
    @Environment(ProductViewModel.self) private var vm
    var product: Product
    @Binding var displayType: DisplayType
    @State private var isFavorite = false
    @State private var isAddingCart = false
    @State private var selectedAmount: AmountType = .weight
    var body: some View {
        Group {
            if displayType == .grid {
                VStack(spacing: 10) {
                    ProductImage(image: product.image, size: 168, priceSale: product.priceSale, discount: product.discount, displayType: displayType)
                        .overlay(alignment: .bottomLeading) {
                            ProductStar(displayType: displayType, rating: product.rating, reviewsAmount: product.reviewsAmount)
                        }
                        .overlay(alignment: .topTrailing) {
                            ProductActions(isFavorite: $isFavorite)
                        }
                    
                    VStack(spacing: 4) {
                        ProductName(name: product.name)
                        
                        if let country = product.country {
                            HStack(spacing: 4) {
                                Text(country.rawValue)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.textIcons003)
                                
                                Text(country.image)
                                    .font(.system(size: 15))
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 4, trailing: 4))
                    
                    Spacer()
                }
                .frame(width: 168, height: 278)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.textStatic001)
                        .shadow(color: .shadowColor001, radius: 8, x: 0, y: 0)
                }
                .overlay(alignment: .bottom) {
                    ProductPrice(product: product, isAddingCart: $isAddingCart, selectedAmount: $selectedAmount)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 4, trailing: 4))
                }
            } else {
                HStack(spacing: 16) {
                    ProductImage(image: product.image, priceSale: product.priceSale, discount: product.discount, displayType: displayType)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            VStack(spacing: 6) {
                                ProductStar(displayType: displayType)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ProductName(name: product.name)
                                
                                if let country = product.country {
                                    HStack(spacing: 4) {
                                        Text(country.rawValue)
                                            .font(.system(size: 12))
                                            .foregroundStyle(.textIcons003)
                                        
                                        Text(country.image)
                                            .font(.system(size: 15))
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            ProductActions(isFavorite: $isFavorite)
                        }
                        
                        Spacer()
                        
                        ProductPrice(product: product, isAddingCart: $isAddingCart, selectedAmount: $selectedAmount)
                    }
                }
                .frame(height: 144)
                .padding(.vertical, 20)
            }
        }
        .onChange(of: isAddingCart) {
            if isAddingCart {
                vm.addProduct(product: product)
            } else {
                vm.removeProduct(product: product)
            }
        }
    }
    
    @ViewBuilder func ProductName(name: String) -> some View {
        Text(name)
            .font(.system(size: 12))
            .foregroundStyle(.textIcons002)
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    
    ProductCard(product: Product(id: 1,
                                 image: "product1",
                                 name: "Салат Овощной с Крабовыми Палочками",
                                 previousPrice: 123.10,
                                 currentPrice: 100.20,
                                 discount: nil,
                                 rating: 5,
                                 reviewsAmount: 10,
                                 saleType: nil,
                                 amountType: .piece,
                                 country: .france), displayType: .constant(.grid)
    )
    .environment(ProductViewModel())
}
