import UIKit

class OrderHistoryCell: UITableViewCell {

    // Outlets for the UI elements
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!

    // Configure the cell with order history data
    func configure(with orderHistory: OrderHistory) {
        // Assuming each order contains a list of items (CartItem objects)
        if let product = orderHistory.items.first { // Handling one product per order
            // Set up the UI elements with the product data
            productImageView.image = UIImage(named: product.imageName ?? "")
            productNameLabel.text = product.name
            productDescriptionLabel.text = product.details
            productPriceLabel.text = "₹\(product.pricePerUnit * product.quantity)"
        }
    }
}
