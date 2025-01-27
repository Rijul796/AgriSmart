//
//  FarmerCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 20/01/25.
//

import UIKit

class FarmerCell: UICollectionViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        let background = UIView()
        background.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .darkGray : UIColor(white: 0.95, alpha: 1)
        background.tag = 100
        background.translatesAutoresizingMaskIntoConstraints = false

        nameLabel = UILabel()
        profileImageView = UIImageView()

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(background)
        background.addSubview(nameLabel)
        background.addSubview(profileImageView)

        // Apply rounded corners to profileImageView
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            profileImageView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor)
        ])
    }
    
    func configure(with user: User) {
        nameLabel.text = user.profile.name
        profileImageView.image = UIImage(named: user.profile.profileImageUrl ?? "default_image")
    }

    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        if state.traitCollection.userInterfaceStyle == .dark {
            if let background = contentView.viewWithTag(100) {
                background.backgroundColor = .darkGray
            }
        } else {
            if let background = contentView.viewWithTag(100) {
                background.backgroundColor = UIColor(white: 0.95, alpha: 1)
            }
        }
    }
}
