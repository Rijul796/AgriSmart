import UIKit

class FarmerTableViewController: UITableViewController, FarmerTableViewCellDelegate, UISearchBarDelegate {

    var farmers: [User] = SampleData.farmers
    var filteredFarmers: [User] = []
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 250
        
        // Setup search bar
        searchBar.delegate = self
        searchBar.placeholder = "Search farmers"
        searchBar.sizeToFit()
        
        // Add search bar as table header
        tableView.tableHeaderView = searchBar
        
        // Initialize filteredFarmers with the full list of farmers
        filteredFarmers = farmers
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // No need to manually adjust contentInset
        // Table view should automatically adjust based on the header view (search bar)
    }
    
    // Corrected numberOfRowsInSection method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFarmers.count
    }

    // Corrected cellForRowAt method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerCell", for: indexPath) as? FarmerTableViewCell else {
            return UITableViewCell()
        }
        
        let farmer = filteredFarmers[indexPath.row]
        cell.delegate = self
        cell.configure(with: farmer)
        return cell
    }

    // Handle cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFarmer = filteredFarmers[indexPath.row]
        performSegue(withIdentifier: "showFarmerDetail", sender: selectedFarmer)
    }

    // Handle button tap from cell delegate
    func viewProfileButtonTapped(farmer: User) {
        performSegue(withIdentifier: "showFarmerDetail", sender: farmer)
    }

    // Pass data to FarmerProfileViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFarmerDetail",
           let destinationVC = segue.destination as? FarmerProfileViewController,
           let selectedFarmer = sender as? User {
            destinationVC.farmer = selectedFarmer
            destinationVC.products = SampleData.products.filter { $0.farmerId == selectedFarmer.id }
        }
    }
    
    // MARK: - UISearchBarDelegate Methods

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // Show all farmers if search bar is empty
            filteredFarmers = farmers
       }
            else {
            // Filter farmers based on search text (e.g., by name or other properties)
            filteredFarmers = farmers.filter {
                let fullName = "\($0.profile.name) " 
                return fullName.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData() // Reload the table with filtered farmers
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard when search is submitted
    }
}
