import UIKit

class CropTableViewCell: UITableViewCell {
    
    // UI Elements
    let cropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30 // for circular image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let availabilityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let expiryDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Add subviews
        contentView.addSubview(cropImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(availabilityLabel)
        contentView.addSubview(expiryDateLabel)
        contentView.addSubview(editButton)
        
        // Set constraints
        NSLayoutConstraint.activate([
            // Crop Image View
            cropImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cropImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cropImageView.widthAnchor.constraint(equalToConstant: 60),
            cropImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // Title Label
            titleLabel.leadingAnchor.constraint(equalTo: cropImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
            
            // Price Label
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            // Availability Label
            availabilityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            availabilityLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            
            // Expiry Date Label
            expiryDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            expiryDateLabel.topAnchor.constraint(equalTo: availabilityLabel.bottomAnchor, constant: 4),
            expiryDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Edit Button
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            editButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
