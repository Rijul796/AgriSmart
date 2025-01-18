//
//  FarmerProductCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 26/12/24.
//

import UIKit

// MARK: - FarmerProductCell
class FarmerProductCell: UITableViewCell {

    static let identifier = "FarmerProductCell" // Identifier for this cell

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.formattedPrice
        if let rating = product.rating {
            ratingLabel.text = "⭐ \(rating) (\(product.reviewsCount))"
        } else {
            ratingLabel.text = "No ratings"
        }
        if let imageUrl = product.imageUrls.first {
            productImageView.image = UIImage(named: imageUrl) // Placeholder
        } else {
            productImageView.image = UIImage(systemName: "leaf")
        }
    }
}
