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
    var cartItems: [CartItem] = []  // Cart items for the order
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
        placeOrderButton.backgroundColor = UIColor(red: 128, green: 128, blue: 128, alpha: 1.0)
        placeOrderButton.setTitleColor(.white, for: .normal)
        placeOrderButton.layer.cornerRadius = 8
        
        // Initially disable the Place Order button
        placeOrderButton.isEnabled = false
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
        // Update product total price and item count
        productTotalPrice = cartItems.reduce(0) { $0 + (Double($1.pricePerUnit) * Double($1.quantity)) }
        itemCount = cartItems.reduce(0) { $0 + $1.quantity }
        
        // Update price labels
        productPriceLabel.text = "₹\(Int(productTotalPrice))"
        totalLabel.text = "₹\(Int(productTotalPrice + shippingCost))"
        
        // Enable the Place Order button if the total price is greater than 0
        if let totalPrice = Int(productPriceLabel.text?.replacingOccurrences(of: "₹", with: "") ?? ""), totalPrice > 0 {
            placeOrderButton.isEnabled = true
        } else {
            placeOrderButton.isEnabled = false
        }
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
        processOrder()
    }

    private func validateFields() -> Bool {
        let requiredFields = [fullNameTextField, addressLine1TextField,
                              cityTextField, stateTextField, zipTextField]
        return requiredFields.allSatisfy { $0?.text?.isEmpty == false }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func processOrder() {
        // Create an order history instance with current cart details
        let orderHistory = OrderHistory(
            orderId: UUID().uuidString,
            items: cartItems,
            totalPrice: productTotalPrice + shippingCost,
            shippingCost: shippingCost,
            orderDate: Date()
        )

        // Save the order history
        saveOrderHistory(orderHistory)

        // Show success alert
        showAlert(message: "Order placed successfully!") { [self] in
            navigateToOrderHistory()
        }
    }

    private func saveOrderHistory(_ orderHistory: OrderHistory) {
        var ordersHistory = fetchOrderHistory()
        ordersHistory.append(orderHistory)
        
        // Save updated order history to UserDefaults
        if let encodedData = try? JSONEncoder().encode(ordersHistory) {
            UserDefaults.standard.set(encodedData, forKey: "ordersHistory")
            print("Order history saved successfully!")
        }
    }

    private func fetchOrderHistory() -> [OrderHistory] {
        if let savedData = UserDefaults.standard.data(forKey: "ordersHistory"),
           let decodedOrdersHistory = try? JSONDecoder().decode([OrderHistory].self, from: savedData) {
            return decodedOrdersHistory
        }
        return []
    }

    private func navigateToOrderHistory() {
        // Assuming OrderHistoryViewController is the screen where order history is displayed
        if let orderHistoryVC = storyboard?.instantiateViewController(withIdentifier: "OrderHistoryViewController") as? OrderHistoryViewController {
            navigationController?.pushViewController(orderHistoryVC, animated: true)
        }
    }

    private func showAlert(message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion()
        }))
        present(alert, animated: true)
    }
}
