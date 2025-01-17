//
//  FarmerProfileCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 26/12/24.
//

import UIKit

// MARK: - FarmerProfileCell
class FarmerProfileCell: UITableViewCell {

    static let identifier = "FarmerProfileCell" // Identifier for this cell

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!

    private var isFollowing = false  // Track follow state

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with farmer: User) {
        nameLabel.text = farmer.profile.name
        usernameLabel.text = "@" + farmer.profile.username
        emailLabel.text = farmer.profile.email
        if let imageUrl = farmer.profile.profileImageUrl {
            profileImageView.image = UIImage(named: imageUrl) // Placeholder
        } else {
            profileImageView.image = UIImage(systemName: "person.circle")
        }
    }

    @IBAction func toggleFollowState(_ sender: UIButton) {
        isFollowing.toggle()
        if isFollowing {
            followButton.setTitle("Following", for: .normal)
            followButton.backgroundColor = .gray
        } else {
            followButton.setTitle("+ Follow", for: .normal)
            followButton.backgroundColor = .brown
        }
    }
}