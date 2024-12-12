//
//  explore.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation

struct CropExplore {
    let id: Int
    let name: String
    let imageName: String
    let pricePerKg: Double
    let rating: Double
}

let crops = [
    CropExplore(id: 1, name: "Tomato", imageName: "tomato", pricePerKg: 2.5, rating: 4.2),
    CropExplore(id: 2, name: "Potato", imageName: "potato", pricePerKg: 1.8, rating: 4.5),
    CropExplore(id: 3, name: "Carrot", imageName: "carrot", pricePerKg: 3.0, rating: 4.0)
]

// View Controller

//import UIKit
//
//class ExploreViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
//    var cropList = crops // Crop data
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    @objc func addToCartButtonTapped(sender: UIButton) {
//        let crop = cropList[sender.tag]
//        print("Added to cart: \(crop.name)")
//        // Handle adding to cart logic here
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension ExploreViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cropList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CropCell", for: indexPath) as! CropTableViewCell
//        let crop = cropList[indexPath.row]
//        cell.configure(with: crop)
//        cell.addToCartButton.tag = indexPath.row
//        cell.addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped(sender:)), for: .touchUpInside)
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension ExploreViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let crop = cropList[indexPath.row]
//        print("Selected crop: \(crop.name)")
//        // Handle navigation to detailed crop view
//    }
//}


// table view

//import UIKit
//
//class CropTableViewCell: UITableViewCell {
//    @IBOutlet weak var cropImageView: UIImageView!
//    @IBOutlet weak var cropNameLabel: UILabel!
//    @IBOutlet weak var pricePerKgLabel: UILabel!
//    @IBOutlet weak var ratingLabel: UILabel!
//    @IBOutlet weak var addToCartButton: UIButton!
//
//    func configure(with crop: Crop) {
//        cropImageView.image = UIImage(named: crop.imageName) // Replace with actual image loading logic
//        cropNameLabel.text = crop.name
//        pricePerKgLabel.text = "$\(crop.pricePerKg) / kg"
//        ratingLabel.text = "⭐️ \(crop.rating)"
//    }
//}
//


