//
//  ProductCategory.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation
import UIKit

// MARK: - Product Categories
enum ProductCategory: String, CaseIterable {
    case grains = "Grains"
    case pulses = "Pulses"
    case vegetables = "Vegetables"
    case fruits = "Fruits"
    case dairy = "Dairy"
    case spices = "Spices"
    case organic = "Organic"
}

// MARK: - Form Validation
struct ProductFormValidation {
    static func validateName(_ name: String) -> Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    static func validatePrice(_ price: Double) -> Bool {
        return price > 0
    }
    
    static func validateQuantity(_ quantity: Double) -> Bool {
        return quantity > 0
    }
    
    static func validateExpirationDate(_ date: Date) -> Bool {
        return date > Date()
    }
    
    static func validateDescription(_ description: String) -> Bool {
        return description.trimmingCharacters(in: .whitespaces).count >= 10
    }
}

// MARK: - Product Creation Model
struct NewProduct {
    var name: String
    var category: ProductCategory
    var description: String
    var price: Double
    var quantity: Double
    var expirationDate: Date
    var images: [UIImage]
    var farmerId: Int
    
    // Validation
    var isValid: Bool {
        return ProductFormValidation.validateName(name) &&
               ProductFormValidation.validatePrice(price) &&
               ProductFormValidation.validateQuantity(quantity) &&
               ProductFormValidation.validateExpirationDate(expirationDate) &&
               ProductFormValidation.validateDescription(description) &&
               !images.isEmpty
    }
}

// MARK: - Product Creation View Model
class ProductCreationViewModel {
    private var newProduct: NewProduct?
    private let dataModel: AgriSmartDataModel
    
    init(dataModel: AgriSmartDataModel = .shared) {
        self.dataModel = dataModel
    }
    
    // MARK: - Form Data
    var categories: [String] {
        return ProductCategory.allCases.map { $0.rawValue }
    }
    
    // MARK: - Product Creation Methods
    func createNewProduct(name: String,
                        category: String,
                        description: String,
                        price: Double,
                        quantity: Double,
                        expirationDate: Date,
                        images: [UIImage],
                        farmerId: Int) -> Result<ProduceListing, ProductCreationError> {
        
        guard let productCategory = ProductCategory(rawValue: category) else {
            return .failure(.invalidCategory)
        }
        
        let newProduct = NewProduct(
            name: name,
            category: productCategory,
            description: description,
            price: price,
            quantity: quantity,
            expirationDate: expirationDate,
            images: images,
            farmerId: farmerId
        )
        
        guard newProduct.isValid else {
            return .failure(.invalidData)
        }
        
        // Create ProduceListing from NewProduct
        let produceListing = ProduceListing(
            id: Int(Date().timeIntervalSince1970),
            farmerId: farmerId,
            title: name,
            description: description,
            category: category,
            type: productCategory.rawValue,
            pricePerUnit: price,
            imageUrl: "temp_url", // Would be replaced with actual upload URL
            status: ProduceStatus(
                percentageLeft: 100,
                totalQuantity: quantity,
                unit: "kg"
            ),
            createdAt: Date(),
            location: "Location", // Would be fetched from user profile
            isOrganic: category == ProductCategory.organic.rawValue
        )
        
        dataModel.addProduceListing(produceListing)
        return .success(produceListing)
    }
}

// MARK: - Error Handling
enum ProductCreationError: Error {
    case invalidData
    case invalidCategory
    case imageUploadFailed
    case networkError
    
    var errorMessage: String {
        switch self {
        case .invalidData:
            return "Please check all fields are filled correctly"
        case .invalidCategory:
            return "Invalid product category selected"
        case .imageUploadFailed:
            return "Failed to upload product images"
        case .networkError:
            return "Network error occurred. Please try again"
        }
    }
}

// MARK: - View Controller Extension
extension UIViewController {
    func showProductCreationError(_ error: ProductCreationError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.errorMessage,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// Example usage in ViewController:
/*
class AddProductViewController: UIViewController {
    private let viewModel = ProductCreationViewModel()
    
    @IBAction func publishButtonTapped(_ sender: Any) {
        let result = viewModel.createNewProduct(
            name: nameTextField.text ?? "",
            category: categoryTextField.text ?? "",
            description: descriptionTextView.text ?? "",
            price: Double(priceTextField.text ?? "0") ?? 0,
            quantity: Double(quantityTextField.text ?? "0") ?? 0,
            expirationDate: expirationDatePicker.date,
            images: selectedImages,
            farmerId: currentFarmerId
        )
        
        switch result {
        case .success(let product):
            // Handle successful creation
            navigationController?.popViewController(animated: true)
        case .failure(let error):
            showProductCreationError(error)
        }
    }
}
*/