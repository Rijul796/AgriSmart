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
        priceLabel.text = "₹\(item.quantity * item.pricePerUnit) per kg"
        quantityLabel.text = "\(item.quantity) kg"
        quantityStepper.value = Double(item.quantity)
        
        // Set the product image or fallback to a default image
        if let imageName = item.imageName {
            productImageView.image = UIImage(named: imageName)
        } else {
            productImageView.image = UIImage(systemName: "leaf")
        }
        
        updateQuantity = onQuantityChange
    }

    
    @IBAction func quantityChanged(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        quantityLabel.text = "\(newQuantity) Kg"
        updateQuantity?(newQuantity)
    }
}
