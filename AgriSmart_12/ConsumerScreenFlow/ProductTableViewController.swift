import UIKit

class ProductTableViewController: UITableViewController {
    var products: [Product] = SampleData.products
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Explore"
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell else {
            fatalError("ProductCell not found!")
        }

        let product = products[indexPath.row]

        // Configure Cell
        cell.configure(with: product)
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped(_:)), for: .touchUpInside)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedProduct = products[indexPath.row]
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
        let selectedProduct = products[sender.tag]
        if CartManager.shared.isProductInCart(selectedProduct.id) {
            // Change button to "Go to Cart"
            performSegue(withIdentifier: "showAddToCart", sender: nil)
        } else {
            CartManager.shared.addProduct(selectedProduct)
            sender.setTitle("Go to Cart", for: .normal)
        }
    }
}
