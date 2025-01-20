//
//  ProductDetailViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 14/01/25.
//

import UIKit

class ProductDetailViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var deliveryAvailabilityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewsTableView: UITableView!

    // MARK: - Properties
    var product: Product?
    var isProductInCart = false
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
    }

    // MARK: - Setup Methods
    private func setupUI() {
        guard let product = product else { return }
        productImageView.image = UIImage(named: product.imageNames.first ?? "placeholder") // Use imageNames
        productNameLabel.text = product.name
        productPriceLabel.text = product.formattedPrice
        productRatingLabel.text = "Rating: \(product.rating ?? 0.0) (\(product.reviewsCount) reviews)"
        quantityLabel.text = "Quantity: \(Int(stepper.value)) kg"
        descriptionLabel.text = product.description
        deliveryAvailabilityLabel.text = "Yes Available!"
        updateAddToCartButton()
    }

    private func configureTableView() {
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
        reviewsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReviewCell")
    }

    // MARK: - Actions
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        quantityLabel.text = "Quantity: \(Int(sender.value)) kg"
    }

    @IBAction func addToCartTapped(_ sender: UIButton) {
        if isProductInCart {
            navigateToCart()
        } else {
            isProductInCart.toggle()
            CartManager.shared.addProduct(product!)
            updateAddToCartButton()
        }
    }

    private func updateAddToCartButton() {
        addToCartButton.setTitle(isProductInCart ? "Go to Cart" : "Add to Cart", for: .normal)
    }

    private func navigateToCart() {
        performSegue(withIdentifier: "showAddToCart", sender: self)
    }

    // Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddToCart",
           let destinationVC = segue.destination as? AddToCartViewController {
            destinationVC.cartItems = CartManager.shared.cartItems
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ProductDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product?.reviews.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        if let review = product?.reviews[indexPath.row] {
            cell.textLabel?.text = review
            cell.textLabel?.numberOfLines = 0
        }
        return cell
    }
}
