//
//  Category.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 19/12/24.
//


import Foundation

// Structure to represent a product category
struct Category {
    var id: Int
    var name: String
}

// Structure to represent a product
struct Product {
    var id: Int
    var name: String
    var category: Category
    var description: String
    var price: Double
    var quantity: Int
    var createdAt: Date
}

// Class to manage product data
class ProductDataModel {
    private var products: [Product] = []
    static let shared = ProductDataModel()
    
    // Sample categories
    private let categories = [
        Category(id: 1, name: "Electronics"),
        Category(id: 2, name: "Clothing"),
        Category(id: 3, name: "Books"),
        Category(id: 4, name: "Home & Kitchen"),
        Category(id: 5, name: "Sports")
    ]
    
    private init() {
        // Initialize with sample data if needed
    }
    
    // Method to add a new product
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    // Method to get all products
    func getAllProducts() -> [Product] {
        return products
    }
    
    // Method to get all categories
    func getAllCategories() -> [Category] {
        return categories
    }
    
    // Method to get a product by ID
    func getProduct(by id: Int) -> Product? {
        return products.first { $0.id == id }
    }
    
    // Method to update a product
    func updateProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index] = product
        }
    }
    
    // Method to delete a product
    func deleteProduct(id: Int) {
        products.removeAll { $0.id == id }
    }
    
    // Method to filter products by category
    func getProducts(by categoryId: Int) -> [Product] {
        return products.filter { $0.category.id == categoryId }
    }
}