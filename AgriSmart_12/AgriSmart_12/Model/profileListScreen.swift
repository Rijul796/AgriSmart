//
//  profileListScreen.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//


import Foundation

// MARK: - FarmerProfile Struct
struct FarmerProfile {
    var id: Int
    var name: String
    var profileImageUrl: String
    var distanceFromBuyer: Double // Distance in kilometers
    var starRating: Double
}

// MARK: - FarmerProfileListing Class
class FarmerProfileListing {
    private(set) var farmers: [FarmerProfile]
    
    private init(farmers: [FarmerProfile]) {
        self.farmers = farmers
    }
    
    // MARK: - Static Sample Data
    static func sampleData() -> FarmerProfileListing {
        let farmers = [
            FarmerProfile(id: 1, name: "John Smith", profileImageUrl: "farmer1.jpg", distanceFromBuyer: 2.5, starRating: 4.5),
            FarmerProfile(id: 2, name: "Emily Brown", profileImageUrl: "farmer2.jpg", distanceFromBuyer: 1.2, starRating: 4.7),
            FarmerProfile(id: 3, name: "Michael Green", profileImageUrl: "farmer3.jpg", distanceFromBuyer: 3.8, starRating: 4.2)
        ]
        return FarmerProfileListing(farmers: farmers)
    }
    
    // MARK: - Search Functionality
    func searchFarmers(byName name: String) -> [FarmerProfile] {
        return farmers.filter { $0.name.lowercased().contains(name.lowercased()) }
    }
    
    // MARK: - Sorting Functionality
    func sortFarmersByNearest() -> [FarmerProfile] {
        return farmers.sorted { $0.distanceFromBuyer < $1.distanceFromBuyer }
    }
    
    // MARK: - Access Farmer Profile
    func getFarmerProfile(byId id: Int) -> FarmerProfile? {
        return farmers.first { $0.id == id }
    }
}



//import UIKit
//
//class FarmerListViewController: UIViewController {
//    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet weak var tableView: UITableView!
//
//    var farmers = sampleFarmers // Original data
//    var filteredFarmers = sampleFarmers // Filtered data for the table view
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        searchBar.delegate = self
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    private func sortFarmers() {
//        filteredFarmers.sort(by: { $0.distance < $1.distance })
//        tableView.reloadData()
//    }
//
//    private func searchFarmers(query: String) {
//        if query.isEmpty {
//            filteredFarmers = farmers
//        } else {
//            filteredFarmers = farmers.filter { $0.name.lowercased().contains(query.lowercased()) }
//        }
//        tableView.reloadData()
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension FarmerListViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredFarmers.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerCell", for: indexPath) as! FarmerTableViewCell
//        let farmer = filteredFarmers[indexPath.row]
//        cell.configure(with: farmer)
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension FarmerListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let farmer = filteredFarmers[indexPath.row]
//        // Navigate to the farmer's profile
//        print("Selected farmer: \(farmer.name)")
//    }
//}
//
//// MARK: - UISearchBarDelegate
//extension FarmerListViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchFarmers(query: searchText)
//    }
//}
//



//
//import UIKit
//
//class FarmerTableViewCell: UITableViewCell {
//    @IBOutlet weak var profileImageView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var ratingLabel: UILabel!
//    @IBOutlet weak var viewProfileButton: UIButton!
//
//    func configure(with farmer: FarmerProfile) {
//        profileImageView.image = UIImage(named: farmer.profileImage) // Replace with actual image loading logic
//        nameLabel.text = farmer.name
//        distanceLabel.text = "\(farmer.distance) km away"
//        ratingLabel.text = "⭐️ \(farmer.rating)"
//    }
//}
