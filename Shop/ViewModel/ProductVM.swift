// Created by Vlad Lysenka 09.08.2024

import SwiftUI
import Observation

@Observable class ProductViewModel {
    var productsCart: [Product] = []
    
    func addProduct(product: Product) {
        self.productsCart.append(product)
    }
    
    func removeProduct(product: Product) {
        self.productsCart.removeAll { $0.id == product.id }
    }
}
