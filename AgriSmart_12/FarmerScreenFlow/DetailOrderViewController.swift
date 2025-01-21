//
//  DetailOrderViewController.swift
//  home_page_apex
//
//  Created by student-2 on 10/12/24.
//

import UIKit

class DetailOrderViewController: UITableViewController {

    // MARK: - Properties
    var listingTitle: String?
    var listingStock: String?
    var listingImageName: String?
    var cropDetails: [(String, String)] = []

    // MARK: - Outlets
    @IBOutlet weak var cropImageView: UIImageView!
    @IBOutlet weak var cropTitleLabel: UILabel!

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Populate crop details
        cropDetails = [
            ("Total Stock Left", listingStock ?? "N/A"),
            ("Total Stock Sold", "30%"), // Example static data
            ("Current Price", "$25.00"), // Example static data
            ("Expiry Date", "2024-12-30"), // Example static data
            ("Low Stock Warning", "Yes") // Example static data
        ]
        
        // Set up header view data
        cropTitleLabel.text = listingTitle
        if let imageName = listingImageName {
            cropImageView.image = UIImage(named: imageName)
        }
        
        // Add footer view with button
        configureFooterView()
    }

    // MARK: - Footer View Configuration
    private func configureFooterView() {
        // Create the footer view
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        footerView.backgroundColor = .clear
        
        // Create the Restock button
        let restockButton = UIButton(type: .system)
        restockButton.setTitle("Restock", for: .normal)
        restockButton.setTitleColor(.systemBlue, for: .normal)
        restockButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        restockButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add target action for button
        restockButton.addTarget(self, action: #selector(restockButtonTapped), for: .touchUpInside)
        
        // Add the button to the footer view
        footerView.addSubview(restockButton)
        
        // Set button constraints
        NSLayoutConstraint.activate([
            restockButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            restockButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            restockButton.heightAnchor.constraint(equalToConstant: 44),
            restockButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        // Assign the footer view to the table
        tableView.tableFooterView = footerView
    }

    // MARK: - Button Action
    @objc private func restockButtonTapped() {
        let alert = UIAlertController(title: "Restock", message: "Restocking triggered for \(listingTitle ?? "this crop")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cropDetails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        let detail = cropDetails[indexPath.row]
        cell.textLabel?.text = detail.0
        cell.detailTextLabel?.text = detail.1
        return cell
    }
}
