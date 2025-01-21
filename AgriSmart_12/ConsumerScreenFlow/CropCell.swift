//
//  CropCell.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 20/01/25.
//

import UIKit

class CropCell: UICollectionViewCell {
    @IBOutlet  var cropImageView: UIImageView!
    @IBOutlet  var cropNameLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        cropImageView = UIImageView()
        cropNameLabel = UILabel()
        
        cropImageView.translatesAutoresizingMaskIntoConstraints = false
        cropNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cropImageView)
        contentView.addSubview(cropNameLabel)
        
        NSLayoutConstraint.activate([
            cropImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cropImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cropImageView.widthAnchor.constraint(equalToConstant: 100),
            cropImageView.heightAnchor.constraint(equalToConstant: 100),
            
            cropNameLabel.topAnchor.constraint(equalTo: cropImageView.bottomAnchor, constant: 10),
            cropNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    func configure(with crop: Product) {
        cropImageView.image = UIImage(named: crop.imageNames[0])
        cropNameLabel.text = crop.name
    }
}
