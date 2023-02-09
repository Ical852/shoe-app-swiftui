//
//  Covid.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 31/01/23.
//

import Foundation
import SwiftUI

struct Meta: Codable {
    var message : String
    var code : Int
    var status : String
}

struct Category: Codable, Identifiable {
    var id : Int
    var name : String
}

struct ProductImage: Codable, Identifiable {
    var id : Int
    var product_id : Int
    var image : String
}

struct Products : Codable, Identifiable {
    var id : Int
    var name : String
    var category_id : Int
    var desc : String
    var price : Int
    var category : Category
    var product_image : [ProductImage]
}

struct ShoesResponse: Codable {
    public var meta: Meta
    public var data: [Products]
}
