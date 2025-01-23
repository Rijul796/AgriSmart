import UIKit

class FarmerTableViewController: UITableViewController, FarmerTableViewCellDelegate {

    var farmers: [User] = SampleData.farmers

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 250
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return farmers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerCell", for: indexPath) as? FarmerTableViewCell else {
            return UITableViewCell()
        }
        let farmer = farmers[indexPath.row]
        cell.delegate = self
        cell.configure(with: farmer)
        return cell
    }

    // Navigate to FarmerProfileViewController on cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFarmer = farmers[indexPath.row]
        performSegue(withIdentifier: "showFarmerDetail", sender: selectedFarmer)
    }
    func viewProfileButtonTapped(farmer: User) {
        performSegue(withIdentifier: "showFarmerDetail", sender: self)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFarmerDetail",
           let destinationVC = segue.destination as? FarmerProfileViewController,
           let selectedFarmer = sender as? User {
            destinationVC.farmer = selectedFarmer
            destinationVC.products = SampleData.products.filter { $0.farmerId == selectedFarmer.id }
        }
    }

}
