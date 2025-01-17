//
//  AddToCartViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 15/01/25.
//

import UIKit

class AddToCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var summaryTextView: UITextView!
    
    // Cart Items Data
    var cartItems: [CartItem] = [
        CartItem(name: "Organic Apple", details: "50kg, Red", pricePerUnit: 100, quantity: 5, imageName: "apple"),
        CartItem(name: "Fresh Tomatoes", details: "20kg, Green", pricePerUnit: 50, quantity: 10, imageName: "tomato"),
        CartItem(name: "Organic Potatoes", details: "30kg, Brown", pricePerUnit: 40, quantity: 15, imageName: "potato")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100 // Set the row height you desire (in points)

        
        // Register custom cell
        // tableView.register(UINib(nibName: "CartItemCell", bundle: nil), forCellReuseIdentifier: "CartItemCell")
        
        // Update Total and Summary
        updateTotal()
        updateSummary()
    }
    
    // Update Total Calculation
    func updateTotal() {
        let total = cartItems.reduce(0) { $0 + ($1.pricePerUnit * $1.quantity) }
        totalLabel.text = "Total: ₹\(total)"
    }
    
    // Update Cart Summary (Show item names and their individual prices)
    func updateSummary() {
        var summaryText = ""
        
        for item in cartItems {
            let itemTotal = item.pricePerUnit * item.quantity
            summaryText += "\(item.name): ₹\(itemTotal)\n"
        }
        
        // Display the summary in the TextView
        summaryTextView.text = summaryText
    }
    
    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        let item = cartItems[indexPath.row]
        
        cell.configure(with: item) { [weak self] newQuantity in
            guard let self = self else { return }
            self.cartItems[indexPath.row].quantity = newQuantity
            self.updateTotal()
            self.updateSummary()  // Update the summary after quantity change
        }
        
        return cell
    }
    
    // TableView Delegate Methods (Optional: Delete an Item)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotal()
            updateSummary()  // Update the summary after item deletion
        }
    }
    
    // Proceed to Checkout Button Action
    @IBAction func proceedToCheckout(_ sender: UIButton) {
        print("Proceeding to checkout with items: \(cartItems)")
    }
}
