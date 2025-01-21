import UIKit

struct Products {
    let name: String
    let expiry: String
    let price: String
    let weight: String
}

class ListingsFarmerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var products = [
        Products(name: "Potatoes", expiry: "Expiry: 01/05/2025", price: "Price per kg: Rs 100", weight: "200kg"),
        Products(name: "Corn", expiry: "Expiry: 01/08/2025", price: "Price per kg: Rs 80", weight: "100kg"),
        Products(name: "Barley", expiry: "Expiry: 03/10/2025", price: "Price per kg: Rs 100", weight: "120kg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Number of rows in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    // Cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.detailTextLabel?.text = """
            \(product.expiry)
            \(product.price)
            \(product.weight)
        """
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    
    // Add swipe-to-delete and swipe-to-edit functionality using UIContextualAction
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // Delete product from the data source
            self.products.remove(at: indexPath.row)
            // Remove row from table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        // Edit action (can be used to perform an edit)
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            // Here you can implement your edit functionality, such as presenting a form to update the product
            print("Edit product at index \(indexPath.row)")
            completionHandler(true)
        }
        
        // Configure actions
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .blue
        
        // Return the swipe actions configuration
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
