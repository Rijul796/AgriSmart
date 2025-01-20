//
//  ProductTableViewCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 23/12/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!

    func configure(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = product.formattedPrice
        productRatingLabel.text = "\(product.rating ?? 0.0) ★ (\(product.reviewsCount))"
        productImageView.image = UIImage(named: product.imageNames.first ?? "default_image") // Replaced with imageNames property
    }
}
