import UIKit

class FarmerProfileViewController: UIViewController {

    var farmer: User? {
        didSet {
            updateFarmerProfile()
        }
    }
    var products: [Product] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var farmerImage: UIImageView!
    @IBOutlet weak var farmername: UILabel!
    @IBOutlet weak var farmerUsername: UILabel!
    @IBOutlet weak var farmeremail: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        updateFarmerProfile()
        farmerImage.layer.cornerRadius = farmerImage.frame.width / 2
        farmerImage.layer.masksToBounds = true
        farmerImage.layer.borderWidth = 2.0
        farmerImage.layer.borderColor = UIColor.systemBlue.cgColor
        farmerImage.contentMode = .scaleAspectFill
    }
  
    private func setupUI() {
        view.backgroundColor = .white
        if let farmerName = farmer?.profile.name {
            title = "\(farmerName)'s Profile" // Dynamically set the title
        } else {
            title = "Farmer Profile" // Fallback title
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func updateFarmerProfile() {
        guard let farmer = farmer else {
            print("Farmer object is nil")
            return
        }
 
        farmername?.text = farmer.profile.name
        farmerUsername?.text = farmer.profile.username
        farmeremail?.text = farmer.profile.email
 
        if let imageUrl = farmer.profile.profileImageUrl {
            farmerImage?.image = UIImage(named: imageUrl)
        } else {
            farmerImage?.image = UIImage(systemName: "person.circle")
        }
    }
 
    @IBAction func followButtonTapped(_ sender: UIButton) {
    }

    @IBAction func messageButtonTapped(_ sender: UIButton) {
        // Perform the segue to the NewChat screen
        performSegue(withIdentifier: "newChat", sender: nil)
    }

    // Merge the prepare function to handle both segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newChat",
           let destinationVC = segue.destination as? NewChatViewController {
            // Pass the farmer as the recipient to the NewChatViewController
            destinationVC.recipient = farmer
        } else if segue.identifier == "showProductDetail",
                  let destinationVC = segue.destination as? ProductDetailViewController,
                  let selectedProduct = sender as? Product {
            // Pass the selected product to the ProductDetailViewController
            destinationVC.product = selectedProduct
        }
    }
}

extension FarmerProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FarmerProductCell", for: indexPath) as? FarmerProductCell else {
            return UITableViewCell()
        }
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
}

extension FarmerProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let product = products[indexPath.row]
        performSegue(withIdentifier: "showProductDetail", sender: product)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Published Products"
    }
}
