//
//  NewProduct.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct NewProduct {
    var name: String
    var category: String
    var description: String
    var price: Double
    var quantity: Int
    var expirationDate: Date
    var image: Data? // Image data or URL if uploading to a server.
}
