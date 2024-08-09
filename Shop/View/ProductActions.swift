// Created by Vlad Lysenka 09.08.2024 

import SwiftUI

struct ProductActions: View {
    var displayType: DisplayType = .grid
    @Binding var isFavorite: Bool
    var body: some View {
        VStack(spacing: 0) {
            Button {
                print("сomposition")
            } label: {
                Image(.сomposition)
                    .frame(width: 16, height: 16)
                    .padding(8)
            }
            
            Button {
                isFavorite.toggle()
            } label: {
                Image(isFavorite ? .favoritefill : .favorite)
                    .frame(width: 16, height: 16)
                    .padding(8)
            }
        }
        .background(displayType == .grid ? .textStatic001.opacity(0.8) : .clear, in: .rect(cornerRadius: 16))
    }
}

#Preview {
    ProductActions(isFavorite: .constant(true))
}
