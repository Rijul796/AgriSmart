//
//  CartItemCell.swift
//  AgriSmart_12
//
//  Created by student-2 on 15/01/25.
//


import UIKit

class CartItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var productImageView: UIImageView!
    private var updateQuantity: ((Int) -> Void)?
    
    func configure(with item: CartItem, onQuantityChange: @escaping (Int) -> Void) {
        nameLabel.text = item.name
        detailsLabel.text = item.details
        priceLabel.text = "₹\(item.quantity * item.pricePerUnit)"
        quantityLabel.text = "\(item.quantity)"
        quantityStepper.value = Double(item.quantity)
        updateQuantity = onQuantityChange
    }
    
    
    @IBAction func quantityChanged(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        quantityLabel.text = "\(newQuantity)"
        updateQuantity?(newQuantity)
    }
}

