////
////  Cart.swift
////  AgriSmart_12
////
////  Created by Rohan Jain on 12/12/24.
////
//
//import Foundation
//
//// MARK: - CartItem Model
//struct CartItem {
//    let image: String // Image URL or resource name
//    let name: String
//    let description: String
//    let pricePerKg: Double
//    var quantity: Int
//    
//    // Computed property for total price of this item
//    var totalPrice: Double {
//        return pricePerKg * Double(quantity)
//    }
//}
//
//// MARK: - CartSummary Model
//struct CartSummary {
//    var subtotal: Double
//    var shippingCost: Double
//    var total: Double {
//        return subtotal + shippingCost
//    }
//}
//
//// MARK: - ShoppingCart Model
//final class ShoppingCart {
//    private(set) var items: [CartItem] = []
//    private(set) var summary: CartSummary = CartSummary(subtotal: 0, shippingCost: 0)
//    
//    private init() {}
//    static let shared = ShoppingCart() // Singleton to avoid redeclaration
//    
//    // MARK: - Methods
//    
//    // Add an item to the cart
//    func addItem(_ item: CartItem) {
//        items.append(item)
//        recalculateSummary()
//    }
//    
//    // Remove an item from the cart
//    func removeItem(at index: Int) {
//        guard index >= 0 && index < items.count else { return }
//        items.remove(at: index)
//        recalculateSummary()
//    }
//    
//    // Update the quantity of an item
//    func updateItemQuantity(at index: Int, quantity: Int) {
//        guard index >= 0 && index < items.count else { return }
//        items[index].quantity = quantity
//        recalculateSummary()
//    }
//    
//    // Recalculate the summary based on current items
//    private func recalculateSummary() {
//        let subtotal = items.reduce(0) { $0 + $1.totalPrice }
//        let shippingCost = subtotal > 0 ? 200 : 0 // Fixed shipping cost
//        summary = CartSummary(subtotal: subtotal, shippingCost: Double(shippingCost))
//    }
//    
//    // Clear the cart
//    func clearCart() {
//        items.removeAll()
//        recalculateSummary()
//    }
//}
//
//
//
///*
// import UIKit
//
// class CartViewController: UIViewController {
//     @IBOutlet weak var tableView: UITableView!
//     @IBOutlet weak var totalLabel: UILabel!
//
//     var cartItems = cartItems // Shopping cart data
//     let shippingCost = 200.0  // Flat shipping cost
//
//     override func viewDidLoad() {
//         super.viewDidLoad()
//         tableView.dataSource = self
//         tableView.delegate = self
//         calculateTotal()
//     }
//
//     func calculateTotal() {
//         let total = cartItems.reduce(0) { $0 + $1.pricePerKg * Double($1.quantity) } + shippingCost
//         totalLabel.text = "₹\(total)"
//     }
//
//     @objc func increaseQuantity(sender: UIButton) {
//         let index = sender.tag
//         cartItems[index].quantity += 1
//         tableView.reloadData()
//         calculateTotal()
//     }
//
//     @objc func decreaseQuantity(sender: UIButton) {
//         let index = sender.tag
//         if cartItems[index].quantity > 1 {
//             cartItems[index].quantity -= 1
//             tableView.reloadData()
//             calculateTotal()
//         }
//     }
// }
//
// // MARK: - UITableViewDataSource
// extension CartViewController: UITableViewDataSource {
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return cartItems.count
//     }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
//         let item = cartItems[indexPath.row]
//
//         cell.configure(with: item)
//         cell.increaseButton.tag = indexPath.row
//         cell.decreaseButton.tag = indexPath.row
//         cell.increaseButton.addTarget(self, action: #selector(increaseQuantity(sender:)), for: .touchUpInside)
//         cell.decreaseButton.addTarget(self, action: #selector(decreaseQuantity(sender:)), for: .touchUpInside)
//         return cell
//     }
// }
//
// // MARK: - UITableViewDelegate
// extension CartViewController: UITableViewDelegate {
//     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//         return 100 // Adjust height as per your layout
//     }
// }
//
// */
//
///*
// import UIKit
//
// class CartTableViewCell: UITableViewCell {
//     @IBOutlet weak var cropImageView: UIImageView!
//     @IBOutlet weak var cropNameLabel: UILabel!
//     @IBOutlet weak var cropDescriptionLabel: UILabel!
//     @IBOutlet weak var priceLabel: UILabel!
//     @IBOutlet weak var quantityLabel: UILabel!
//     @IBOutlet weak var increaseButton: UIButton!
//     @IBOutlet weak var decreaseButton: UIButton!
//
//     func configure(with item: CartItem) {
//         cropImageView.image = UIImage(named: item.imageName) // Replace with image loading logic
//         cropNameLabel.text = item.name
//         cropDescriptionLabel.text = item.description
//         priceLabel.text = "₹\(item.pricePerKg) per kg"
//         quantityLabel.text = "\(item.quantity)"
//     }
// }
//
// */
