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
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
    }

    // MARK: - Setup Methods
    private func setupUI() {
        guard let product = product else { return }
        productImageView.image = UIImage(named: product.imageUrls.first ?? "placeholder")
        productNameLabel.text = product.name
        productPriceLabel.text = product.formattedPrice
        productRatingLabel.text = "Rating: \(product.rating ?? 0.0) (\(product.reviewsCount) reviews)"
        quantityLabel.text = "Quantity: \(Int(stepper.value)) kg"
        descriptionLabel.text = product.description
        deliveryAvailabilityLabel.text = "Yes Available!"
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
        print("Add to cart tapped for \(product?.name ?? "")")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ProductDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // Placeholder for reviews count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        let reviews = [
            "These apples are incredibly fresh and delicious. I love that they are organic.",
            "The best apples I've ever had! They are so juicy and flavorful. Highly recommend!"
        ]
        cell.textLabel?.text = reviews[indexPath.row]
        return cell
    }
}
