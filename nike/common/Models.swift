//
//  Models.swift
//  nike
//
//  Created by CSF on 09.01.2024.
//

import Foundation

struct ImageCardModel: Identifiable {

    var id: Int
    var imageName: String
    var text: String

}

struct CategoryModel: Identifiable {

    var id: String {category}
    var imageName: String
    var category: String

}

struct ProductCardModel: Identifiable {

    var id: Int
    var imageName: String
    var status: ProductStatus = .none
    var title: String
    var subtitle: String
    var price: String

}

enum ProductStatus: String {
    case none = "", soldOut = "Sold Out", bestseller = "Bestseller"
}

