//
//  ProductTableViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 23/12/24.
//

import UIKit

class ProductTableViewController: UITableViewController {

    // MARK: - Properties
    var products: [Product] = [
        Product(
            id: UUID(),
            name: "Organic Apples",
            category: .fruits,
            pricePerKg: 100.0,
            quantityAvailable: 50.0,
            originalQuantity: 100.0,
            description: "Fresh organic apples from local farms.",
            imageUrls: ["apple_image"], // Replace with your actual image URLs or asset names
            status: .available,
            expiryDate: Date().addingTimeInterval(60 * 60 * 24 * 7), // 1 week later
            farmerId: UUID(),
            rating: 4.8,
            reviewsCount: 120
        ),
        Product(
            id: UUID(),
            name: "Fresh Mangoes",
            category: .fruits,
            pricePerKg: 120.0,
            quantityAvailable: 30.0,
            originalQuantity: 50.0,
            description: "Juicy mangoes sourced directly from organic farms.",
            imageUrls: ["mango_image"], // Replace with your actual image URLs or asset names
            status: .available,
            expiryDate: Date().addingTimeInterval(60 * 60 * 24 * 10), // 10 days later
            farmerId: UUID(),
            rating: 4.5,
            reviewsCount: 95
        )
    ]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register Cell
//        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        // Set Navigation Title
        self.title = "Explore"
    }
    
    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell else {
            fatalError("ProductCell not found!")
        }
        
        let product = products[indexPath.row]
        
        // Configure Cell
        cell.productNameLabel.text = product.name
        cell.productPriceLabel.text = product.formattedPrice
        cell.productRatingLabel.text = "\(product.rating ?? 0.0) ★ (\(product.reviewsCount))"
        cell.productImageView.image = UIImage(named: product.imageUrls.first ?? "default_image") // Replace with actual image handling logic
        
        // Configure Button
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: #selector(addToCartTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    // MARK: - Add to Cart Action
    @objc func addToCartTapped(_ sender: UIButton) {
        let product = products[sender.tag]
        print("\(product.name) added to cart!")
        // Add logic to update cart (use your Cart model)
    }
}
