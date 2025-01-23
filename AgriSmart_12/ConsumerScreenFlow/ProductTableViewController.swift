import UIKit

class ProductTableViewController: UITableViewController, UISearchBarDelegate {
    var products: [Product] = SampleData.products
    var filteredProducts: [Product] = []
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Explore"

        // Set the delegate of the searchBar
        searchBar.delegate = self
        
        searchBar.placeholder = "Search products"
        searchBar.sizeToFit() // Ensure the search bar fits its content
        tableView.tableHeaderView = searchBar
        
        filteredProducts = products
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell else {
            fatalError("ProductCell not found!")
        }

        let product = filteredProducts[indexPath.row] // Use filteredProducts instead of products

        // Configure Cell
        cell.configure(with: product)
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped(_:)), for: .touchUpInside)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedProduct = filteredProducts[indexPath.row] // Use filteredProducts instead of products
        performSegue(withIdentifier: "showProductDetail", sender: selectedProduct)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail",
           let destinationVC = segue.destination as? ProductDetailViewController,
           let selectedProduct = sender as? Product {
            destinationVC.product = selectedProduct
        } else if segue.identifier == "showAddToCart",
                  let destinationVC = segue.destination as? AddToCartViewController {
            destinationVC.cartItems = CartManager.shared.cartItems
        }
    }

    @objc func addToCartButtonTapped(_ sender: UIButton) {
        let selectedProduct = filteredProducts[sender.tag] // Use filteredProducts instead of products
        if CartManager.shared.isProductInCart(selectedProduct.id) {
            // Change button to "Go to Cart"
            performSegue(withIdentifier: "showAddToCart", sender: nil)
        } else {
            CartManager.shared.addProduct(selectedProduct)
            sender.setTitle("Go to Cart", for: .normal)
        }
    }

    // MARK: - UISearchBarDelegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // Show all products if search bar is empty
            filteredProducts = products
        } else {
            // Filter products based on the search text
            filteredProducts = products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData() // Reload the table with filtered products
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard when search is submitted
    }
}

