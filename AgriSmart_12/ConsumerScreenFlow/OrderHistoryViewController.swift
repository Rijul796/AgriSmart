import UIKit

class OrderHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var noOrdersLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! 
    // Array to hold order history data
    var orderHistory: [OrderHistory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self // Set the delegate

        // Fetch order history data from UserDefaults
        orderHistory = fetchOrderHistory()

        // Check if orderHistory is empty and show the label accordingly
        updateUI()

        // Reload the table view to show the data
        tableView.reloadData()
    }

    func fetchOrderHistory() -> [OrderHistory] {
        let decoder = JSONDecoder()

        // Retrieve data from UserDefaults using the correct key
        if let data = UserDefaults.standard.data(forKey: "ordersHistory") {
            do {
                // Decode the data into an array of OrderHistory objects
                let orderHistory = try decoder.decode([OrderHistory].self, from: data)
                print("Fetched order history: \(orderHistory)")
                return orderHistory
            } catch {
                print("Error decoding order history: \(error)")
            }
        }
        return []
    }

    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCell", for: indexPath) as! OrderHistoryCell
        let order = orderHistory[indexPath.row]
        
        // Pass the order data to the cell
        cell.configure(with: order)

        return cell
    }

    // TableView Delegate Method to set the height of the row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // Set a fixed height of 120 for each cell
    }

    // Swipe-to-Delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from the order history
            orderHistory.remove(at: indexPath.row)
            
            // Save the updated order history
            saveOrderHistory(orderHistory)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .automatic)

            // Check if the array is empty and update the UI
            updateUI()
        }
    }

    // Method to save updated order history to UserDefaults
    private func saveOrderHistory(_ orderHistory: [OrderHistory]) {
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(orderHistory) {
            UserDefaults.standard.set(encodedData, forKey: "ordersHistory")
        }
    }

    // Method to update the UI based on order history
    private func updateUI() {
        // Show the "No orders yet" label if orderHistory is empty
        noOrdersLabel.isHidden = !orderHistory.isEmpty
        tableView.isHidden = orderHistory.isEmpty
    }
}
