//
//  FarmerTableViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 23/12/24.
//

import UIKit

class FarmerTableViewController: UITableViewController {

    // Sample Data: Using the User model for farmers with Indian credentials
    var farmers: [User] = [
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Rajesh Kumar",
                username: "rajesh_kumar",
                email: "rajesh@example.com",
                contactNumber: "9876543210",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date(),
                profileImageUrl: "rajesh",
                defaultAddress: nil,
                savedAddresses: [
                    Address(
                        fullName: "Rajesh Kumar",
                        addressLine1: "123, Main Road",
                        addressLine2: "Near Green Park",
                        city: "Delhi",
                        state: "Delhi",
                        zipCode: "110001",
                        contactNumber: "9876543210"
                    )
                ]
            ),
            settings: UserSettings(pushNotificationsEnabled: true, darkModeEnabled: false, emailNotificationsEnabled: true),
            status: .online,
            metrics: UserMetrics(postCount: 15, commentCount: 8, isTopContributor: true, rating: 4.2, reviewCount: 22)
        ),
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Aarti Sharma",
                username: "aarti_sharma",
                email: "aarti@example.com",
                contactNumber: "9876543211",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date(),
                profileImageUrl: "aarti",
                defaultAddress: nil,
                savedAddresses: [
                    Address(
                        fullName: "Aarti Sharma",
                        addressLine1: "45, Lajpat Nagar",
                        addressLine2: "Opposite Bus Stop",
                        city: "Mumbai",
                        state: "Maharashtra",
                        zipCode: "400001",
                        contactNumber: "9876543211"
                    )
                ]
            ),
            settings: UserSettings(pushNotificationsEnabled: true, darkModeEnabled: false, emailNotificationsEnabled: true),
            status: .online,
            metrics: UserMetrics(postCount: 12, commentCount: 5, isTopContributor: false, rating: 4.8, reviewCount: 18)
        ),
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Vikram Singh",
                username: "vikram_singh",
                email: "vikram@example.com",
                contactNumber: "9876543212",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date(),
                profileImageUrl: "vikram",
                defaultAddress: nil,
                savedAddresses: [
                    Address(
                        fullName: "Vikram Singh",
                        addressLine1: "78, Greenfield Colony",
                        addressLine2: "Behind Market",
                        city: "Chennai",
                        state: "Tamil Nadu",
                        zipCode: "600001",
                        contactNumber: "9876543212"
                    )
                ]
            ),
            settings: UserSettings(pushNotificationsEnabled: true, darkModeEnabled: false, emailNotificationsEnabled: true),
            status: .online,
            metrics: UserMetrics(postCount: 20, commentCount: 10, isTopContributor: true, rating: 4.5, reviewCount: 30)
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(UINib(nibName: "FarmerTableViewCell", bundle: nil), forCellReuseIdentifier: "FarmerCell")
        tableView.rowHeight = 120/*UITableView.automaticDimension*/
        tableView.estimatedRowHeight = 250
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return farmers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerCell", for: indexPath) as? FarmerTableViewCell else {
            return UITableViewCell()
        }
        let farmer = farmers[indexPath.row]
        cell.configure(with: farmer) // Pass the User model (farmer) to the configure method
        return cell
    }

    // Handle View Profile Button Action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let farmer = farmers[indexPath.row]
        print("View Profile for \(farmer.profile.name)")
    }
}
