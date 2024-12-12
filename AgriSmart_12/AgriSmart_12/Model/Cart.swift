//
//  Cart.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation
struct CartItem {
    let id: Int
    let name: String
    let imageName: String
    let pricePerKg: Double
    var quantity: Int
    let description: String
}

let cartItems = [
    CartItem(id: 1, name: "Organic Apple", imageName: "apple", pricePerKg: 100.0, quantity: 50, description: "50Kg, Red")
]



/*
 import UIKit

 class CartViewController: UIViewController {
     @IBOutlet weak var tableView: UITableView!
     @IBOutlet weak var totalLabel: UILabel!

     var cartItems = cartItems // Shopping cart data
     let shippingCost = 200.0  // Flat shipping cost

     override func viewDidLoad() {
         super.viewDidLoad()
         tableView.dataSource = self
         tableView.delegate = self
         calculateTotal()
     }

     func calculateTotal() {
         let total = cartItems.reduce(0) { $0 + $1.pricePerKg * Double($1.quantity) } + shippingCost
         totalLabel.text = "₹\(total)"
     }

     @objc func increaseQuantity(sender: UIButton) {
         let index = sender.tag
         cartItems[index].quantity += 1
         tableView.reloadData()
         calculateTotal()
     }

     @objc func decreaseQuantity(sender: UIButton) {
         let index = sender.tag
         if cartItems[index].quantity > 1 {
             cartItems[index].quantity -= 1
             tableView.reloadData()
             calculateTotal()
         }
     }
 }

 // MARK: - UITableViewDataSource
 extension CartViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return cartItems.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
         let item = cartItems[indexPath.row]

         cell.configure(with: item)
         cell.increaseButton.tag = indexPath.row
         cell.decreaseButton.tag = indexPath.row
         cell.increaseButton.addTarget(self, action: #selector(increaseQuantity(sender:)), for: .touchUpInside)
         cell.decreaseButton.addTarget(self, action: #selector(decreaseQuantity(sender:)), for: .touchUpInside)
         return cell
     }
 }

 // MARK: - UITableViewDelegate
 extension CartViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100 // Adjust height as per your layout
     }
 }

 */

/*
 import UIKit

 class CartTableViewCell: UITableViewCell {
     @IBOutlet weak var cropImageView: UIImageView!
     @IBOutlet weak var cropNameLabel: UILabel!
     @IBOutlet weak var cropDescriptionLabel: UILabel!
     @IBOutlet weak var priceLabel: UILabel!
     @IBOutlet weak var quantityLabel: UILabel!
     @IBOutlet weak var increaseButton: UIButton!
     @IBOutlet weak var decreaseButton: UIButton!

     func configure(with item: CartItem) {
         cropImageView.image = UIImage(named: item.imageName) // Replace with image loading logic
         cropNameLabel.text = item.name
         cropDescriptionLabel.text = item.description
         priceLabel.text = "₹\(item.pricePerKg) per kg"
         quantityLabel.text = "\(item.quantity)"
     }
 }

 */
