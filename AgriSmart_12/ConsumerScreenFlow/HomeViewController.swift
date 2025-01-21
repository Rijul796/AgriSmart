//
//  HomeViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 20/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var farmersCollectionView: UICollectionView!
    @IBOutlet weak var cropsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFarmersCollectionView()
        setupCropsCollectionView()
        registerCollectionViewCells()
        setupNavigationBarIcons()
    }

    private func setupFarmersCollectionView() {
        farmersCollectionView.delegate = self
        farmersCollectionView.dataSource = self
        farmersCollectionView.collectionViewLayout = createFarmersLayout()
    }
    
    private func setupNavigationBarIcons() {
        // Notification button (left side)
        let notificationButton = UIBarButtonItem(
            image: UIImage(systemName: "bell"), // SF Symbol for notification
            style: .plain,
            target: self,
            action: #selector(notificationButtonTapped)
        )
        
        // Cart button (right side)
        let cartButton = UIBarButtonItem(
            image: UIImage(systemName: "cart"), // SF Symbol for cart
            style: .plain,
            target: self,
            action: #selector(cartButtonTapped)
        )

        // Add notification button to the left side of the navigation bar
        navigationItem.leftBarButtonItem = notificationButton

        // Add cart button to the right side of the navigation bar
        navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc private func notificationButtonTapped() {
        // Navigate to the notifications screen
        performSegue(withIdentifier: "showNotifications", sender: self)
    }

    @objc private func cartButtonTapped() {
        // Navigate to the cart screen
        performSegue(withIdentifier: "showCart", sender: self)
    }


    private func setupCropsCollectionView() {
        cropsCollectionView.delegate = self
        cropsCollectionView.dataSource = self
        cropsCollectionView.collectionViewLayout = createCropsLayout()
    }

    private func registerCollectionViewCells() {
        farmersCollectionView.register(FarmerCell.self, forCellWithReuseIdentifier: "FarmerCell")
        cropsCollectionView.register(CropCell.self, forCellWithReuseIdentifier: "CropCell")
    }

    private func createFarmersLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10)

        return UICollectionViewCompositionalLayout(section: section)
    }

    private func createCropsLayout() -> UICollectionViewCompositionalLayout {
        // Define item size for 3 items in the first row
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Set minimal spacing between items
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        // Define group size (3 items in the first row)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])

        // Define section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10) 
        section.orthogonalScrollingBehavior = .continuous // Horizontal scrolling

        // For subsequent rows, reuse the same group definition with minimal gaps
        let additionalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let additionalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: additionalGroupSize, subitems: [item, item, item])

        // Additional row section
        let additionalSection = NSCollectionLayoutSection(group: additionalGroup)
        additionalSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10)

        // Return the final layout
        return UICollectionViewCompositionalLayout(section: section)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showFarmerDetail",
               let destinationVC = segue.destination as? FarmerProfileViewController,
               let indexPath = farmersCollectionView.indexPathsForSelectedItems?.first {
                let selectedFarmer = SampleData.farmers[indexPath.row]
                destinationVC.farmer = selectedFarmer
            } else if segue.identifier == "showProductDetail",
                      let destinationVC = segue.destination as? ProductDetailViewController,
                      let indexPath = cropsCollectionView.indexPathsForSelectedItems?.first {
                let selectedProduct = SampleData.products[indexPath.row]
                destinationVC.product = selectedProduct
            }         else if segue.identifier == "showNotifications" {
                let destinationVC = segue.destination as! NotificationViewController
            } else if segue.identifier == "showCart" {
                let destinationVC = segue.destination as! AddToCartViewController
            }
        }


}

// Extension for UICollectionViewDelegate and UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == farmersCollectionView ? SampleData.farmers.count : SampleData.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == farmersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FarmerCell", for: indexPath) as! FarmerCell
            let farmer = SampleData.farmers[indexPath.row]
            cell.configure(with: farmer)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CropCell", for: indexPath) as! CropCell
            let product = SampleData.products[indexPath.row]
            cell.configure(with: product)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == farmersCollectionView {
            performSegue(withIdentifier: "showFarmerDetail", sender: self)
        } else if collectionView == cropsCollectionView {
            performSegue(withIdentifier: "showProductDetail", sender: self)
        }
    }
}
