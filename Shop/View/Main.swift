// Created by Vlad Lysenka 09.08.2024

import SwiftUI

struct Main: View {
    @Environment(ProductViewModel.self) private var vm
    @Environment(\.colorScheme) private var scheme
    
    @State private var displayType: DisplayType = .list
    @State private var isCart: Bool = false
    let columns: [GridItem] = Array(repeating: GridItem(spacing: -35), count: 2)
    
    var body: some View {
        VStack(spacing: 0) {
            Navbar
            
            Divider()
            
            ScrollView {
                if displayType == .grid {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(gridProduct, id: \.self) { product in
                            ProductCard(product: product, displayType: $displayType)
                        }
                        .safeAreaPadding(EdgeInsets(top: 9, leading: 17, bottom: 0, trailing: 17))
                    }
                } else {
                    LazyVStack {
                        ForEach(listProducts, id: \.self) { product in
                            ProductCard(product: product, displayType: $displayType)
                            
                            Divider()
                        }
                    }
                    .safeAreaPadding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17))
                }
            }
        }
        .safeAreaPadding(.bottom, 60)
        .overlay(alignment: .bottomTrailing) {
            Button {
                isCart.toggle()
            } label: {
                HStack {
                    Image(.cartIcon)
                        .padding(5)
                        .background(.primary001, in: .circle)
                    
                    Text("\(vm.productsCart.count)")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(scheme == .light ? .black : .white)
                    
                }
                .padding()
                .background(.ultraThinMaterial, in: .capsule)
                .padding(.trailing)
            }
        }
        .sheet(isPresented: $isCart) {
            NavigationStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(vm.productsCart, id: \.self) { product in
                            Text(product.name)
                                .font(.system(size: 18, weight: .regular, design: .rounded))
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                    .safeAreaPadding(.horizontal)
                }
                .navigationTitle("Корзина")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    var Navbar: some View {
        HStack {
            Button {
                if displayType == .grid {
                    displayType = .list
                } else {
                    displayType = .grid
                }
            } label: {
                Image(systemName: displayType == .grid ? "square.grid.2x2" : "rectangle.grid.1x2")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .symbolEffect(.bounce, value: displayType)
            }
            .foregroundStyle(.primary001)
            .padding(12)
            .background(.surfaces002, in: .rect(cornerRadius: 12))
            
            Spacer()
        }
        .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 0))
    }
}

#Preview {
    Main()
        .environment(ProductViewModel())
}
