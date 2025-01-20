//
//  ListingsFarmer.swift
//  home_page_apex
//
//  Created by Chetan Puri on 17/01/25.
//

import UIKit

class ListingsFarmer: UITableViewController {
    
    var items = ["Item 1", "Item 2", "Item 3"]  // Example data
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
