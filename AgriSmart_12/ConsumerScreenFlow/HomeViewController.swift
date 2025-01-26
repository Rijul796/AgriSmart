import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var farmersCollectionView: UICollectionView!
    @IBOutlet weak var cropsCollectionView: UICollectionView!

    var cropCategories: [ProductCategory: [Product]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFarmersCollectionView()
        setupCropsCollectionView()
        registerCollectionViewCells()
        setupNavigationBarIcons()
        loadCropCategories()
    }

    private func setupFarmersCollectionView() {
        farmersCollectionView.delegate = self
        farmersCollectionView.dataSource = self
        farmersCollectionView.collectionViewLayout = createFarmersLayout()
    }

    private func setupCropsCollectionView() {
        cropsCollectionView.delegate = self
        cropsCollectionView.dataSource = self
        cropsCollectionView.collectionViewLayout = createCropsLayout()
    }

    private func registerCollectionViewCells() {
        farmersCollectionView.register(FarmerCell.self, forCellWithReuseIdentifier: "FarmerCell")
        cropsCollectionView.register(CropCell.self, forCellWithReuseIdentifier: "CropCell")
        cropsCollectionView.register(
            CropHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "CropHeaderView"
        )
    }

    private func setupNavigationBarIcons() {
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartButtonTapped))
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(notificationButtonTapped))
        navigationItem.rightBarButtonItems = [cartButton, notificationButton]
    }

    private func loadCropCategories() {
        for crop in SampleData.products {
            if let category = ProductCategory(rawValue: crop.category.rawValue) {
                cropCategories[category, default: []].append(crop)
            }
        }
    }

    private func createFarmersLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10)

        return UICollectionViewCompositionalLayout(section: section)
    }

    private func createCropsLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]

        return UICollectionViewCompositionalLayout(section: section)
    }

    @objc private func cartButtonTapped() {
        performSegue(withIdentifier: "showCart", sender: self)
    }

    @objc private func notificationButtonTapped() {
        performSegue(withIdentifier: "showNotifications", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFarmerDetail",
           let destination = segue.destination as? FarmerProfileViewController,
           let farmer = sender as? User {
            destination.farmer = farmer
        } else if segue.identifier == "showProductDetail",
                  let destination = segue.destination as? ProductDetailViewController,
                  let product = sender as? Product {
            destination.product = product
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionView == cropsCollectionView ? cropCategories.keys.count : 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cropsCollectionView {
            let category = Array(cropCategories.keys)[section]
            return cropCategories[category]?.count ?? 0
        }
        return SampleData.farmers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == farmersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FarmerCell", for: indexPath) as! FarmerCell
            cell.configure(with: SampleData.farmers[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CropCell", for: indexPath) as! CropCell
            let category = Array(cropCategories.keys)[indexPath.section]
            if let crop = cropCategories[category]?[indexPath.row] {
                cell.configure(with: crop)
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == farmersCollectionView {
            let farmer = SampleData.farmers[indexPath.row]
            performSegue(withIdentifier: "showFarmerDetail", sender: farmer)
        } else {
            let category = Array(cropCategories.keys)[indexPath.section]
            if let crop = cropCategories[category]?[indexPath.row] {
                performSegue(withIdentifier: "showProductDetail", sender: crop)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "CropHeaderView",
            for: indexPath
        ) as! CropHeaderView

        let category = Array(cropCategories.keys)[indexPath.section]
        header.titleLabel.text = category.rawValue
        return header
    }
}
