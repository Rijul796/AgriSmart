//
//  FarmerProductCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 26/12/24.
//

import UIKit

class FarmerProductCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.formattedPrice
        if let rating = product.rating {
            ratingLabel.text = "⭐ \(rating) (\(product.reviewsCount))"
        } else {
            ratingLabel.text = "No ratings"
        }
        if let imageUrl = product.imageUrls.first {
            productImageView.image = UIImage(named: imageUrl)
        } else {
            productImageView.image = UIImage(systemName: "leaf")
        }
    }
}
