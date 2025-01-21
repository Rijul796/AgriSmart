//
//  CheckoutViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 15/01/25.
//


// CheckoutViewController.swift

import UIKit

class CheckoutViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var addressLine1TextField: UITextField!
    @IBOutlet weak var addressLine2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var placeOrderButton: UIButton!

    // MARK: - Properties
    var cartItems: [CartItem] = []
    var productTotalPrice: Double = 0.0
    var shippingCost: Double = 200.0
    var itemCount: Int = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFields()
        updatePrices()
        displayCartSummary()
    }

    // MARK: - UI Setup
    private func setupUI() {
        title = "Checkout"

        // Style the labels
        orderSummaryLabel.font = .systemFont(ofSize: 24, weight: .bold)

        // Style the button
        placeOrderButton.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        placeOrderButton.setTitleColor(.white, for: .normal)
        placeOrderButton.layer.cornerRadius = 8
    }

    private func setupTextFields() {
        let textFields = [fullNameTextField, addressLine1TextField,
                          addressLine2TextField, cityTextField,
                          stateTextField, zipTextField]

        textFields.forEach { textField in
            textField?.layer.cornerRadius = 8
            textField?.layer.borderWidth = 1
            textField?.layer.borderColor = UIColor.systemGray5.cgColor
            textField?.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            textField?.leftViewMode = .always
        }

        addressLine2TextField.placeholder = "Optional"
    }

    private func updatePrices() {
        productTotalPrice = cartItems.reduce(0) { $0 + (Double($1.pricePerUnit) * Double($1.quantity)) }
        itemCount = cartItems.reduce(0) { $0 + $1.quantity }
        productPriceLabel.text = "₹\(Int(productTotalPrice))"
        totalLabel.text = "₹\(Int(productTotalPrice + shippingCost))"
    }

    private func displayCartSummary() {
        var summaryText = "Total Items: \(itemCount)\n"
        for item in cartItems {
            summaryText += "\(item.name): ₹\(item.pricePerUnit * item.quantity)\n"
        }
        orderSummaryLabel.text = summaryText
    }

    // MARK: - Actions
    @IBAction func placeOrderTapped(_ sender: UIButton) {
        guard validateFields() else {
            showAlert(message: "Please fill in all required fields")
            return
        }

        // Process the order
        processOrder()
    }

    private func validateFields() -> Bool {
        let requiredFields = [fullNameTextField, addressLine1TextField,
                              cityTextField, stateTextField, zipTextField]
        return requiredFields.allSatisfy { $0?.text?.isEmpty == false }
    }

    private func processOrder() {
        // Add your order processing logic here
        showAlert(message: "Order placed successfully!")
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
