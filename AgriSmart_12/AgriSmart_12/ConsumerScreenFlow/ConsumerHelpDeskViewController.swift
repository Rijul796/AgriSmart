//
//  ConsumerHelpDeskViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 20/01/25.
//


//
//  ConsumerHelpDeskViewController.swift
//  home_page_apex
//
//  Created by student-2 on 19/12/24.
//

import UIKit

class ConsumerHelpDeskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Consumer-specific help topics and details
    let helpTopics = [
        "How to search for products?",
        "How to place an order?",
        "How to track my order?",
        "What to do if my order is delayed?"
    ]
    let helpDetails = [
        "You can search for products using the search bar on the home screen.",
        "To place an order, add items to your cart and proceed to checkout.",
        "You can track your orders in the 'Order Status' section.",
        "If your order is delayed, contact support through the 'Help Desk' section."
    ]
    
    var expandedCells: Set<Int> = [] // To keep track of expanded cells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "helpCell")
    }
    
    // MARK: - TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath)
        cell.textLabel?.text = helpTopics[indexPath.row]
        cell.textLabel?.numberOfLines = expandedCells.contains(indexPath.row) ? 0 : 1 // Expand or collapse the cell text
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if expandedCells.contains(indexPath.row) {
            expandedCells.remove(indexPath.row) // Collapse the cell if already expanded
        } else {
            expandedCells.insert(indexPath.row) // Expand the cell
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedCells.contains(indexPath.row) {
            return UITableView.automaticDimension // Dynamic height for expanded cell
        } else {
            return 44.0 // Standard height for collapsed cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
