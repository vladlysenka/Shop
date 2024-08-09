// Created by Vlad Lysenka 09.08.2024 

import SwiftUI

struct Product: Identifiable, Hashable, Codable {
    
    let id: Int
    let image: String
    let name: String
    let previousPrice: Double
    let currentPrice: Double
    let discount: Int?
    let rating: Double
    let reviewsAmount: Int
    let priceSale: PriceSale?
    let amountType: AmountType
    let country: Country?
    
    init(id: Int,
         image: String,
         name: String,
         previousPrice: Double,
         currentPrice: Double,
         discount: Int?,
         rating: Double,
         reviewsAmount: Int,
         saleType: PriceSale?,
         amountType: AmountType,
         country: Country?)
    {
        self.id    = id
        self.name  = name
        self.previousPrice = previousPrice
        self.currentPrice = currentPrice
        self.discount = discount
        self.priceSale = saleType
        self.rating = rating
        self.reviewsAmount = reviewsAmount
        self.image = image
        self.amountType = amountType
        self.country = country
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}


var gridProduct: [Product] = [
    Product(id: 8,
            image: "product8",
            name: "сыр Ламбер 500/0 230г",
            previousPrice: 199.0,
            currentPrice: 99.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .hitPrice,
            amountType: .weight,
            country: nil),
    Product(id: 9,
            image: "product9",
            name: "Энергетический Напит",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 10,
            image: "product10",
            name: "Салат Овощной с Крабовыми Палочками",
            previousPrice: 199.0,
            currentPrice: 250.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 11,
            image: "product11",
            name: "Дорадо Охлажденная Непотрошеная 300-400г",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .both,
            country: nil),
    Product(id: 12,
            image: "product12",
            name: "Ролл Маленькая Япония 216г",
            previousPrice: 199.0,
            currentPrice: 367.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .new,
            amountType: .weight,
            country: nil),
    Product(id: 13,
            image: "product13",
            name: "Огурцы тепличные cадово-огородные",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .cardPrice,
            amountType: .weight,
            country: .france),
    Product(id: 14,
            image: "product14",
            name: "Манго Кео",
            previousPrice: 199.0,
            currentPrice: 129.9,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .new,
            amountType: .weight,
            country: nil),
    Product(id: 15,
            image: "product15",
            name: "Салат Овощной с Крабовыми Палочками",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 16,
            image: "product16",
            name: "Салат Овощной с Крабовыми Палочками",
            previousPrice: 199.0,
            currentPrice: 129.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 17,
            image: "product17",
            name: "Масло Слобода Рафинированное 1,8л",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .hitPrice,
            amountType: .weight,
            country: nil),
    Product(id: 18,
            image: "product18",
            name: "Салат Овощной с Крабовыми Палочками",
            previousPrice: 199.0,
            currentPrice: 259.0,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: .france),
    Product(id: 19,
            image: "product19",
            name: "Макаронные Изделия SPAR Спагетти 450г",
            previousPrice: 199.0,
            currentPrice: 150.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .new,
            amountType: .weight,
            country: nil),
    Product(id: 20,
            image: "product20",
            name: "Огурцы тепличные cадово-огородные",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: .france),
    Product(id: 21,
            image: "product21",
            name: "Огурцы тепличные cадово-огородные",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .cardPrice,
            amountType: .weight,
            country: nil)
]

var listProducts: [Product] = [
    Product(id: 0,
            image: "product0",
            name: "Огурцы тепличные cадово-огородные",
            previousPrice: 190.0,
            currentPrice: 120.9,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .hitPrice,
            amountType: .both,
            country: nil),
    Product(id: 1,
            image: "product1",
            name: "Дорадо Охлажденная Непотрошеная 300-400г",
            previousPrice: 199.0,
            currentPrice: 120.9,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .new,
            amountType: .weight,
            country: .france),
    Product(id: 2,
            image: "product2",
            name: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б",
            previousPrice: 199.0,
            currentPrice: 99.9,
            discount: nil,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: .france),
    Product(id: 3,
            image: "product3",
            name: "Манго Кео",
            previousPrice: 199.0,
            currentPrice: 150.2,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: .hitPrice,
            amountType: .weight,
            country: .france),
    Product(id: 4,
            image: "product0",
            name: "сыр Ламбер 500/0 230г",
            previousPrice: 199.0,
            currentPrice: 150.9,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 5,
            image: "product0",
            name: "сыр Ламбер 500/0 230г",
            previousPrice: 199.0,
            currentPrice: 150.2,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 6,
            image: "product0",
            name: "сыр Ламбер 500/0 230г",
            previousPrice: 199.0,
            currentPrice: 150.2,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil),
    Product(id: 7,
            image: "product0",
            name: "сыр Ламбер 500/0 230г",
            previousPrice: 199.0,
            currentPrice: 150.2,
            discount: 25,
            rating: 4.1,
            reviewsAmount: 19,
            saleType: nil,
            amountType: .weight,
            country: nil)
]
