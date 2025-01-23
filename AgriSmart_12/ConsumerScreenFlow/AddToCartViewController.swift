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
        tableView.rowHeight = 120
        cartItems = CartManager.shared.cartItems
        updateTotal()
        updateSummary()
        let orderHistoryButton = UIBarButtonItem(title: "Order History", style: .plain, target: self, action: #selector(viewOrderHistory))
        navigationItem.rightBarButtonItem = orderHistoryButton
    }
     
    @objc func viewOrderHistory() {
        performSegue(withIdentifier: "showOrderHistory", sender: nil)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOrderHistory" {
            if let destinationVC = segue.destination as? OrderHistoryViewController {
                destinationVC.orderHistory = fetchOrderHistory() ?? []
            }
        }
         
        if segue.identifier == "showCheckout",
           let destinationVC = segue.destination as? CheckoutViewController {
            destinationVC.cartItems = cartItems
        }
    }
 
    func updateTotal() {
        let total = cartItems.reduce(0) { $0 + ($1.pricePerUnit * $1.quantity) }
        totalLabel.text = "Total: ₹\(total)"
        disableCheckoutButtonIfNeeded(total: Double(total))
    }
    func updateSummary() {
        var summaryText = ""

        for item in cartItems {
            let itemTotal = item.pricePerUnit * item.quantity
            summaryText += "\(item.name): ₹\(itemTotal)\n"
        }
         
        summaryTextView.text = summaryText
    }
     
    func disableCheckoutButtonIfNeeded(total: Double) {
        if total > 0 {
            checkoutButton.isEnabled = true
            checkoutButton.tintColor = UIColor(red: 64/255, green: 43/255, blue: 41/255, alpha: 1.0)
        } else {
            checkoutButton.isEnabled = false
            checkoutButton.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        }
        checkoutButton.layer.cornerRadius = 8  
        checkoutButton.layer.masksToBounds = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        let item = cartItems[indexPath.row]
        
        cell.configure(with: item) { [weak self] newQuantity in
            guard let self = self else { return }
            self.cartItems[indexPath.row].quantity = newQuantity
            self.updateTotal()
            self.updateSummary()
        }
        
        return cell
    }
     
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotal()  // Update total after item deletion
            updateSummary()  // Update the summary after item deletion
        }
    }
     
    func fetchOrderHistory() -> [OrderHistory]? {
        let decoder = JSONDecoder()
         
        if let data = UserDefaults.standard.data(forKey: "orderHistory") {
            do {
                let orderHistory = try decoder.decode([OrderHistory].self, from: data)
                return orderHistory
            } catch {
                print("Error decoding order history: \(error)")
            }
        }
        return nil
    }
 
    @IBAction func proceedToCheckout(_ sender: UIButton) {
        performSegue(withIdentifier: "showCheckout", sender: nil)
    }
}
