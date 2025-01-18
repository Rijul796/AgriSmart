//
//  FarmerProfileViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 26/12/24.
//


import UIKit

// MARK: - FarmerProfileViewController
class FarmerProfileViewController: UIViewController {

    // MARK: - Properties
    var farmer: User?
    var products: [Product] = []

    @IBOutlet weak var tableView: UITableView!  // Outlet for the TableView

    // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            setupTableView()
            populateData()
        }

        // MARK: - Setup Methods
        private func setupUI() {
            view.backgroundColor = .white
            title = "Farmer Profile"
        }

        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            // Register the custom cells using their respective identifiers and xib files
//            tableView.register(UINib(nibName: "FarmerProductCell", bundle: nil), forCellReuseIdentifier: FarmerProductCell.identifier)
//            tableView.register(UINib(nibName: "FarmerProfileCell", bundle: nil), forCellReuseIdentifier: FarmerProfileCell.identifier)
        }

        // MARK: - Data Population
        private func populateData() {
            // Sample data for Farmer
            let farmerProfile = Profile(
                name: "John Smith",
                username: "farmerjohn",
                email: "johnsmith@example.com",
                contactNumber: "9876543210",
                dateOfBirth: Date(timeIntervalSince1970: 157785600),
                countryRegion: "India",
                joinedDate: Date(timeIntervalSince1970: 1609459200),
                profileImageUrl: nil,
                defaultAddress: nil,
                savedAddresses: []
            )

            let farmerMetrics = UserMetrics(
                postCount: 10,
                commentCount: 50,
                isTopContributor: true,
                rating: 4.6,
                reviewCount: 110
            )

            farmer = User(
                id: UUID(),
                role: .farmer,
                profile: farmerProfile,
                settings: UserSettings(
                    pushNotificationsEnabled: true,
                    darkModeEnabled: false,
                    emailNotificationsEnabled: true
                ),
                status: .online,
                metrics: farmerMetrics
            )

            // Sample products for the farmer
            let appleProduct = Product(
                id: UUID(),
                name: "Apple",
                category: .fruits,
                pricePerKg: 100.0,
                quantityAvailable: 500,
                originalQuantity: 500,
                description: "Fresh apples from the farm.",
                imageUrls: ["apple_image_url"],
                status: .available,
                expiryDate: Date().addingTimeInterval(7 * 24 * 60 * 60),
                farmerId: farmer!.id,
                rating: 4.5,
                reviewsCount: 90
            )

            let potatoProduct = Product(
                id: UUID(),
                name: "Potatoes",
                category: .vegetables,
                pricePerKg: 10.0,
                quantityAvailable: 1000,
                originalQuantity: 1000,
                description: "Organic potatoes, perfect for cooking.",
                imageUrls: ["potato_image_url"],
                status: .available,
                expiryDate: Date().addingTimeInterval(10 * 24 * 60 * 60),
                farmerId: farmer!.id,
                rating: 4.6,
                reviewsCount: 110
            )

            products = [appleProduct, potatoProduct]

            // Print data to verify
            print("Farmer Data: \(String(describing: farmer))")
            print("Products Data: \(products)")

            // Reload the table view
            tableView.reloadData()
        }
    }

    // MARK: - UITableViewDataSource
    extension FarmerProfileViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Adding one extra row for the farmer profile
            return products.count + 1 // One extra row for the farmer profile
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row == 0 {  // First row for the farmer profile
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerProfileCell", for: indexPath) as? FarmerProfileCell else {
                    return UITableViewCell()
                }
                if let farmer = farmer {
                    cell.configure(with: farmer)
                }
                return cell
            } else {  // Other rows for the farmer's products
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerProductCell", for: indexPath) as? FarmerProductCell else {
                    return UITableViewCell()
                }
                let product = products[indexPath.row - 1] // Adjust index for products
                cell.configure(with: product)
                return cell
            }
        }
    }

    // MARK: - UITableViewDelegate
    extension FarmerProfileViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            // Handle product selection if needed
        }
        // Set row height for FarmerProductCell
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                if indexPath.row == 0 {
                    return UITableView.automaticDimension // For FarmerProfileCell, you can let it adjust automatically
                } else {
                    return 120 // For FarmerProductCell, set the height to 120
                }
            }
    }


























































































//import UIKit
//
//// MARK: - FarmerProfileViewController
//class FarmerProfileViewController: UIViewController {
//
//    // MARK: - Properties
//    var farmer: User?
//    var products: [Product] = []
//
//    private let tableView = UITableView(frame: .zero, style: .plain)
//
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupTableView()
//        populateData()
//    }
//
//    // MARK: - Setup Methods
//    private func setupUI() {
//        view.backgroundColor = .white
//        title = "Farmer Profile"
//
//        // Add TableView
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    private func setupTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(FarmerProductCell.self, forCellReuseIdentifier: FarmerProductCell.identifier)
//        tableView.register(FarmerProfileCell.self, forCellReuseIdentifier: FarmerProfileCell.identifier) // Registering FarmerProfileCell
//    }
//
//    // MARK: - Data Population
//    private func populateData() {
//        // Sample data for Farmer
//        let farmerProfile = Profile(
//            name: "John Smith",
//            username: "farmerjohn",
//            email: "johnsmith@example.com",
//            contactNumber: "9876543210",
//            dateOfBirth: Date(timeIntervalSince1970: 157785600),
//            countryRegion: "India",
//            joinedDate: Date(timeIntervalSince1970: 1609459200),
//            profileImageUrl: nil,
//            defaultAddress: nil,
//            savedAddresses: []
//        )
//
//        let farmerMetrics = UserMetrics(
//            postCount: 10,
//            commentCount: 50,
//            isTopContributor: true,
//            rating: 4.6,
//            reviewCount: 110
//        )
//
//        farmer = User(
//            id: UUID(),
//            role: .farmer,
//            profile: farmerProfile,
//            settings: UserSettings(
//                pushNotificationsEnabled: true,
//                darkModeEnabled: false,
//                emailNotificationsEnabled: true
//            ),
//            status: .online,
//            metrics: farmerMetrics
//        )
//
//        // Sample products for the farmer
//        let appleProduct = Product(
//            id: UUID(),
//            name: "Apple",
//            category: .fruits,
//            pricePerKg: 100.0,
//            quantityAvailable: 500,
//            originalQuantity: 500,
//            description: "Fresh apples from the farm.",
//            imageUrls: ["apple_image_url"],
//            status: .available,
//            expiryDate: Date().addingTimeInterval(7 * 24 * 60 * 60),
//            farmerId: farmer!.id,
//            rating: 4.5,
//            reviewsCount: 90
//        )
//
//        let potatoProduct = Product(
//            id: UUID(),
//            name: "Potatoes",
//            category: .vegetables,
//            pricePerKg: 10.0,
//            quantityAvailable: 1000,
//            originalQuantity: 1000,
//            description: "Organic potatoes, perfect for cooking.",
//            imageUrls: ["potato_image_url"],
//            status: .available,
//            expiryDate: Date().addingTimeInterval(10 * 24 * 60 * 60),
//            farmerId: farmer!.id,
//            rating: 4.6,
//            reviewsCount: 110
//        )
//
//        products = [appleProduct, potatoProduct]
//
//        // Reload the table view
//        tableView.reloadData()
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension FarmerProfileViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Adding one extra row for the farmer profile
//        return products.count + 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {  // First row for the farmer profile
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: FarmerProfileCell.identifier, for: indexPath) as? FarmerProfileCell else {
//                return UITableViewCell()
//            }
//            if let farmer = farmer {
//                cell.configure(with: farmer)
//            }
//            return cell
//        } else {  // Other rows for the farmer's products
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: FarmerProductCell.identifier, for: indexPath) as? FarmerProductCell else {
//                return UITableViewCell()
//            }
//            let product = products[indexPath.row - 1] // Adjust index for products
//            cell.configure(with: product)
//            return cell
//        }
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension FarmerProfileViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        // Handle product selection
//    }
//}
//
//// MARK: - FarmerProfileCell
//class FarmerProfileCell: UITableViewCell {
//
//    static let identifier = "FarmerProfileCell" // Identifier for this cell
//
//    private let profileImageView = UIImageView()
//    private let nameLabel = UILabel()
//    private let usernameLabel = UILabel()
//    private let emailLabel = UILabel()
//    private let followButton = UIButton(type: .system)
//    private let messageButton = UIButton(type: .system)
//
//    private var isFollowing = false  // Track follow state
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupUI() {
//        profileImageView.contentMode = .scaleAspectFill
//        profileImageView.layer.cornerRadius = 50
//        profileImageView.clipsToBounds = true
//
//        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        usernameLabel.font = UIFont.systemFont(ofSize: 14)
//        usernameLabel.textColor = .gray
//        emailLabel.font = UIFont.systemFont(ofSize: 14)
//        emailLabel.textColor = .gray
//
//        followButton.setTitle("+ Follow", for: .normal)
//        followButton.setTitleColor(.white, for: .normal)
//        followButton.backgroundColor = .brown
//        followButton.layer.cornerRadius = 8
//        followButton.addTarget(self, action: #selector(toggleFollowState), for: .touchUpInside)
//
//        messageButton.setTitle("Message", for: .normal)
//        messageButton.setTitleColor(.brown, for: .normal)
//        messageButton.layer.borderWidth = 1
//        messageButton.layer.borderColor = UIColor.brown.cgColor
//        messageButton.layer.cornerRadius = 8
//
//        let stackView = UIStackView(arrangedSubviews: [followButton, messageButton])
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        stackView.distribution = .fillEqually
//
//        let container = UIStackView(arrangedSubviews: [profileImageView, nameLabel, usernameLabel, emailLabel, stackView])
//        container.axis = .vertical
//        container.alignment = .center
//        container.spacing = 8
//
//        contentView.addSubview(container)
//        container.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            profileImageView.widthAnchor.constraint(equalToConstant: 100),
//            profileImageView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//    }
//
//    func configure(with farmer: User) {
//        nameLabel.text = farmer.profile.name
//        usernameLabel.text = "@" + farmer.profile.username
//        emailLabel.text = farmer.profile.email
//        if let imageUrl = farmer.profile.profileImageUrl {
//            profileImageView.image = UIImage(named: imageUrl) // Placeholder
//        } else {
//            profileImageView.image = UIImage(systemName: "person.circle")
//        }
//    }
//
//    @objc private func toggleFollowState() {
//        isFollowing.toggle()
//        if isFollowing {
//            followButton.setTitle("Following", for: .normal)
//            followButton.backgroundColor = .gray
//        } else {
//            followButton.setTitle("+ Follow", for: .normal)
//            followButton.backgroundColor = .brown
//        }
//    }
//}
//
//// MARK: - FarmerProductCell
//class FarmerProductCell: UITableViewCell {
//
//    static let identifier = "FarmerProductCell" // Identifier for this cell
//
//    private let productImageView = UIImageView()
//    private let nameLabel = UILabel()
//    private let priceLabel = UILabel()
//    private let ratingLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupUI() {
//        productImageView.contentMode = .scaleAspectFill
//        productImageView.clipsToBounds = true
//        productImageView.layer.cornerRadius = 8
//
//        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        priceLabel.font = UIFont.systemFont(ofSize: 14)
//        priceLabel.textColor = .blue
//
//        ratingLabel.font = UIFont.systemFont(ofSize: 14)
//        ratingLabel.textColor = .gray
//
//        let infoStack = UIStackView(arrangedSubviews: [nameLabel, priceLabel, ratingLabel])
//        infoStack.axis = .vertical
//        infoStack.spacing = 4
//
//        let container = UIStackView(arrangedSubviews: [productImageView, infoStack])
//        container.axis = .horizontal
//        container.spacing = 12
//
//        contentView.addSubview(container)
//        container.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            productImageView.widthAnchor.constraint(equalToConstant: 80),
//            productImageView.heightAnchor.constraint(equalToConstant: 80)
//        ])
//    }
//
//    func configure(with product: Product) {
//        nameLabel.text = product.name
//        priceLabel.text = product.formattedPrice
//        if let rating = product.rating {
//            ratingLabel.text = "⭐ \(rating) (\(product.reviewsCount))"
//        } else {
//            ratingLabel.text = "No ratings"
//        }
//        if let imageUrl = product.imageUrls.first {
//            productImageView.image = UIImage(named: imageUrl) // Placeholder
//        } else {
//            productImageView.image = UIImage(systemName: "leaf")
//        }
//    }
//}
