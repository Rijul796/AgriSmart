//
//  FarmerProfileViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 26/12/24.
//


import UIKit

class FarmerProfileViewController: UIViewController {

    var farmer: User?
    var products: [Product] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Farmer Profile"
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FarmerProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerProfileCell", for: indexPath) as? FarmerProfileCell else {
                return UITableViewCell()
            }
            if let farmer = farmer {
                cell.configure(with: farmer)
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerProductCell", for: indexPath) as? FarmerProductCell else {
                return UITableViewCell()
            }
            let product = products[indexPath.row - 1]
            cell.configure(with: product)
            return cell
        }
    }
}

extension FarmerProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.row != 0 else { return }

        let product = products[indexPath.row - 1]
        performSegue(withIdentifier: "showProductDetail", sender: product)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail",
           let destinationVC = segue.destination as? ProductDetailViewController,
           let selectedProduct = sender as? Product {
            destinationVC.product = selectedProduct
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 120
        }
    }
}
