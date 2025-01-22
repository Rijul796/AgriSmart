//
//  ConsumerChatCell 2.swift
//  AgriSmart_12
//
//  Created by student-2 on 22/01/25.
//


import UIKit

class ConsumerChatMessageCell: UITableViewCell {
    
    // Define the UI elements (labels, image views)
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code (e.g., customizing appearance)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
    }
}
