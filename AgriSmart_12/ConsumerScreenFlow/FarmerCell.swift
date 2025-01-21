//
//  FarmerCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 20/01/25.
//

import UIKit

class FarmerCell: UICollectionViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet  var profileImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        nameLabel = UILabel()
        profileImageView = UIImageView()

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(nameLabel)
        contentView.addSubview(profileImageView)

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    func configure(with user: User) {
        nameLabel.text = user.profile.name
        profileImageView.image = UIImage(named: user.profile.profileImageUrl ?? "default_image")
    }
}
