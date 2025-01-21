//
//  ProductTableViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 23/12/24.
//

import UIKit

class ProductTableViewController: UITableViewController {

    // MARK: - Properties
    var products: [Product] = SampleData.products
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register Cell
        // tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
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
        cell.configure(with: product)
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped(_:)), for: .touchUpInside)

        return cell
    }

    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: "showProductDetail", sender: selectedProduct)
    }

    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail",
           let destinationVC = segue.destination as? ProductDetailViewController,
           let selectedProduct = sender as? Product {
            destinationVC.product = selectedProduct
        } else if segue.identifier == "showAddToCart",
           let destinationVC = segue.destination as? AddToCartViewController {
            destinationVC.cartItems = CartManager.shared.cartItems
        }
    }

    // MARK: - Add to Cart Action
    @objc func addToCartButtonTapped(_ sender: UIButton) {
        let selectedProduct = products[sender.tag]
        if CartManager.shared.isProductInCart(selectedProduct.id) {
            // Change button to "Go to Cart"
            performSegue(withIdentifier: "showAddToCart", sender: nil)
        } else {
            // Add to Cart
            CartManager.shared.addProduct(selectedProduct)
            sender.setTitle("Go to Cart", for: .normal)
        }
    }
}
