import UIKit

class ConsumerHelpDeskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let helpTopics = [
        "How to search for products?",
        "How to place an order?",
        "How to track my order?",
        "What to do if my order is delayed?"
    ]
    let helpDetails = [
        "You can search for products using the search bar on the home screen.",
        "To place an order, add items to your cart and proceed to checkout.",
        "You can track your orders in the 'Order Status' section.",
        "If your order is delayed, contact support through the 'Help Desk' section."
    ]
    
    var expandedCells: Set<Int> = [] // To keep track of expanded cells
    var filteredHelpTopics: [String] = [] // For search functionality
    var filteredHelpDetails: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "helpCell")
        
        // Initialize filtered arrays with all data
        filteredHelpTopics = helpTopics
        filteredHelpDetails = helpDetails
    }

    // MARK: - TableView DataSource Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredHelpTopics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath)
        let topic = filteredHelpTopics[indexPath.row]
        let detail = filteredHelpDetails[indexPath.row]
        
        if expandedCells.contains(indexPath.row) {
            cell.textLabel?.text = "\(topic)\n\n\(detail)"
        } else {
            cell.textLabel?.text = topic
        }
        
        cell.textLabel?.numberOfLines = expandedCells.contains(indexPath.row) ? 0 : 1 // Expand or collapse text
        return cell
    }

    // MARK: - TableView Delegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if expandedCells.contains(indexPath.row) {
            expandedCells.remove(indexPath.row) // Collapse the cell if already expanded
        } else {
            expandedCells.insert(indexPath.row) // Expand the cell
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedCells.contains(indexPath.row) {
            return UITableView.automaticDimension // Dynamic height for expanded cell
        } else {
            return 44.0 // Standard height for collapsed cell
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    // MARK: - Search Bar Delegate Methods

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // Show all topics and details if search bar is empty
            filteredHelpTopics = helpTopics
            filteredHelpDetails = helpDetails
        } else {
            // Filter topics and details based on search text
            filteredHelpTopics = helpTopics.enumerated().filter { index, topic in
                topic.lowercased().contains(searchText.lowercased()) ||
                helpDetails[index].lowercased().contains(searchText.lowercased())
            }.map { $0.element }
            
            filteredHelpDetails = helpTopics.enumerated().filter { index, topic in
                topic.lowercased().contains(searchText.lowercased()) ||
                helpDetails[index].lowercased().contains(searchText.lowercased())
            }.map { helpDetails[$0.offset] }
        }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset the search bar and show all data
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filteredHelpTopics = helpTopics
        filteredHelpDetails = helpDetails
        tableView.reloadData()
    }
}
