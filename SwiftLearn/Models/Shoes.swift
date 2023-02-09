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

struct TransactionDetailRequest: Codable {
    var product_id: Int
    var qty: Int
}

struct TransactionRequest: Codable {
    var user_id: Int
    var order_id: String
    var gross_amount: Int
    var pay_method: String
    var td_detail: [TransactionDetailRequest]
}

struct User: Codable, Identifiable {
    var id: Int
    var full_name: String
    var email: String
    var phone_number: Int
    var address: String
    var password: String
    var image: String
    var balance: Int
}

struct TransactionDetail: Codable, Identifiable {
    var id: Int
    var transaction_id: Int
    var product_id: Int
    var qty: Int
    var product: Products
}

struct Transaction: Codable, Identifiable {
    var id: Int
    var user_id: Int
    var pay_method: String
    var order_id: String
    var gross_amount: Int
    var status: String
    var payment_url: String
}

struct ShoesResponse: Codable {
    public var meta: Meta
    public var data: [Products]
}

struct TransactionResponse: Codable {
    public var meta: Meta
    public var data: Transaction
}
