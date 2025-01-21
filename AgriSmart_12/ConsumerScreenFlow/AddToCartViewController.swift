import UIKit

class AddToCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var summaryTextView: UITextView!
    
    // Cart Items Data
    var cartItems: [CartItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100 // Set the row height you desire (in points)
        
        // Load cart items from CartManager
        cartItems = CartManager.shared.cartItems
        
        // Update Total and Summary
        updateTotal()
        updateSummary()
        
        // Add Order History Button to the navigation bar
        let orderHistoryButton = UIBarButtonItem(title: "Order History", style: .plain, target: self, action: #selector(viewOrderHistory))
        navigationItem.rightBarButtonItem = orderHistoryButton
    }
    
    // Action for Order History Button
    @objc func viewOrderHistory() {
        // Navigate to Order History screen
        performSegue(withIdentifier: "showOrderHistory", sender: nil)
    }
    
    // Prepare for Segue to Order History
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOrderHistory" {
            if let destinationVC = segue.destination as? OrderHistoryViewController {
                // Fetch order history and pass to the Order History View Controller
                destinationVC.orderHistory = fetchOrderHistory() ?? []
            }
        }
        
        // Prepare for Segue to Checkout
        if segue.identifier == "showCheckout",
           let destinationVC = segue.destination as? CheckoutViewController {
            destinationVC.cartItems = cartItems
        }
    }

    // Update Total Calculation
    func updateTotal() {
        let total = cartItems.reduce(0) { $0 + ($1.pricePerUnit * $1.quantity) }
        totalLabel.text = "Total: ₹\(total)"
        
        // Disable Checkout button if total is zero
        disableCheckoutButtonIfNeeded(total: Double(total))
    }
    
    // Update Cart Summary (Show item names and their individual prices)
    func updateSummary() {
        var summaryText = ""

        for item in cartItems {
            let itemTotal = item.pricePerUnit * item.quantity
            summaryText += "\(item.name): ₹\(itemTotal)\n"
        }
        
        // Display the summary in the TextView
        summaryTextView.text = summaryText
    }
    
    // Disable Checkout Button if total is 0
    func disableCheckoutButtonIfNeeded(total: Double) {
        if total > 0 {
            checkoutButton.isEnabled = true
            checkoutButton.backgroundColor = UIColor.systemBlue  // Reset to normal color
        } else {
            checkoutButton.isEnabled = false
            checkoutButton.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0) // Disabled color (128, 128, 128)
        }
    }
    
    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        let item = cartItems[indexPath.row]
        
        cell.configure(with: item) { [weak self] newQuantity in
            guard let self = self else { return }
            self.cartItems[indexPath.row].quantity = newQuantity
            self.updateTotal()  // Update total after quantity change
            self.updateSummary()  // Update the summary after quantity change
        }
        
        return cell
    }
    
    // TableView Delegate Methods (Optional: Delete an Item)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotal()  // Update total after item deletion
            updateSummary()  // Update the summary after item deletion
        }
    }
    
    // Fetch Order History from UserDefaults
    func fetchOrderHistory() -> [OrderHistory]? {
        let decoder = JSONDecoder()
        
        // Retrieve data from UserDefaults
        if let data = UserDefaults.standard.data(forKey: "orderHistory") {
            do {
                // Decode the data into an array of OrderHistory objects
                let orderHistory = try decoder.decode([OrderHistory].self, from: data)
                return orderHistory
            } catch {
                print("Error decoding order history: \(error)")
            }
        }
        return nil
    }

    // Proceed to Checkout Button Action
    @IBAction func proceedToCheckout(_ sender: UIButton) {
        performSegue(withIdentifier: "showCheckout", sender: nil)
    }
}
