// Created by Vlad Lysenka 09.08.2024

import SwiftUI

struct ProductPrice: View {
    
    var product: Product
    @Binding var isAddingCart: Bool
    @Binding var selectedAmount: AmountType
    
    @State private var currentAmountWeight: Double = 0.1
    @State private var currentAmountPieces: Int = 1
    @State private var currentPrice: Double = 0
    var body: some View {
        VStack(spacing: 10) {
            if product.amountType == .both {
                Picker("Выберите тип", selection: $selectedAmount) {
                    Text("Шт").tag(AmountType.piece)
                    Text("Кг").tag(AmountType.weight)
                }
                .pickerStyle(.segmented)
                .frame(height: 28)
            }
            
            if !isAddingCart {
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        HStack(spacing: 2) {
                            let priceParts = product.currentPrice.splitPrice()
                            
                            Text(priceParts.whole)
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundStyle(.textIcons001)
                            
                            if let fraction = priceParts.fraction {
                                Text(fraction)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.textIcons001)
                            }
                            
                            Image(.rubleIcon)
                                .padding(.bottom, 6)
                            
                            Image(.lineIcon)
                                .padding(.leading, -6)
                            
                            Image(.kgIcon)
                                .padding(.top, 6)
                                .padding(.leading, -6)
                            
                            Spacer()
                        }
                        
                        Text("\(product.previousPrice.toOnePrice())")
                            .font(.system(size: 12))
                            .foregroundStyle(.textIcons003)
                            .strikethrough()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isAddingCart = true
                        }
                    } label: {
                        Image(.cartIcon)
                            .frame(width: 16, height: 16)
                            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                            .background(.primary001, in: .rect(cornerRadius: 40))
                    }
                }
                .frame(height: 36)
                .transition(.scale)
            } else {
                HStack(spacing: 0) {
                    Button {
                        withAnimation {
                            if selectedAmount == .weight && currentAmountWeight >= 0.2 {
                                currentAmountWeight -= 0.1
                                currentPrice = product.currentPrice * currentAmountWeight
                            } else if selectedAmount == .piece && currentAmountPieces > 1 {
                                currentAmountPieces -= 1
                                currentPrice = product.currentPrice * Double(currentAmountPieces)
                            } else {
                                isAddingCart = false
                            }
                        }
                    } label: {
                        Image(.minusIcon)
                            .frame(width: 16, height: 16)
                    }
                    
                    VStack(spacing: 2) {
                        Text(selectedAmount == .weight ? "\(currentAmountWeight.formatted()) кг" : "\(currentAmountPieces) шт")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.textStatic001)
                            .contentTransition(.numericText(value: selectedAmount == .weight ? currentAmountWeight : Double(currentAmountPieces)))
                        
                        Text("~\(currentPrice.toPrice()) ₽")
                            .font(.caption)
                            .foregroundStyle(.textStatic001.opacity(0.8))
                            .contentTransition(.numericText(value: currentPrice))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        withAnimation {
                            if selectedAmount == .weight {
                                currentAmountWeight += 0.1
                                currentPrice = product.currentPrice * currentAmountWeight
                            } else {
                                currentAmountPieces += 1
                                currentPrice = product.currentPrice * Double(currentAmountPieces)
                            }
                        }
                    } label: {
                        Image(.plusIcon)
                            .frame(width: 16, height: 16)
                    }
                    
                }
                .padding(EdgeInsets(top: 2, leading: 11, bottom: 2, trailing: 11))
                .frame(height: 36)
                .background(.primary001, in: .rect(cornerRadius: 40))
                .transition(.scale)
            }
        }
        .onAppear{
            if selectedAmount == .piece {
                currentPrice = product.currentPrice * Double(currentAmountPieces)
            } else if selectedAmount == .weight {
                currentPrice = product.currentPrice * currentAmountWeight
            }
        }
        .onChange(of: selectedAmount) {
            if selectedAmount == .piece {
                currentPrice = product.currentPrice * Double(currentAmountPieces)
            } else {
                currentPrice = product.currentPrice * currentAmountWeight
            }
        }
    }
}

#Preview {
    ProductPrice(product: Product(id: 1,
                                  image: "product1",
                                  name: "Салат Овощной с Крабовыми Палочками",
                                  previousPrice: 123.10,
                                  currentPrice: 100.20,
                                  discount: nil,
                                  rating: 5,
                                  reviewsAmount: 10,
                                  saleType: nil,
                                  amountType: .piece,
                                  country: .france), isAddingCart: .constant(false), selectedAmount: .constant(.both))
}
