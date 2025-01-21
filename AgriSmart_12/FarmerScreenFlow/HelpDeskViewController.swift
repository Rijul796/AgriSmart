//
//  HelpDeskViewController.swift
//  home_page_apex
//
//  Created by student-2 on 19/12/24.
//

import UIKit

class HelpDeskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let helpTopics = ["How to change password?", "How to update profile?", "How to contact support?", "App not working issues"]
    let helpDetails = [
        "You can change your password from the 'Change password' option in the settings.",
        "To update your profile, go to 'Edit profile' in the settings.",
        "Contact support via the 'Help Desk' option in settings.",
        "If the app is not working, try restarting or reinstalling the app."
    ]
    
    var expandedCells: Set<Int> = [] // To keep track of which cells are expanded
    
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
