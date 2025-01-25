//import UIKit
//
//class CropCell: UICollectionViewCell {
//    @IBOutlet var cropImageView: UIImageView!
//    @IBOutlet var cropNameLabel: UILabel!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupViews()
//    }
//
//    private func setupViews() {
//        let background = UIView()
//        background.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .darkGray : UIColor(white: 0.95, alpha: 1)
//        background.tag = 100
//        background.translatesAutoresizingMaskIntoConstraints = false
//
//        cropImageView = UIImageView()
//        cropNameLabel = UILabel()
//        
//        cropImageView.translatesAutoresizingMaskIntoConstraints = false
//        cropNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        contentView.addSubview(background)
//        background.addSubview(cropImageView)
//        background.addSubview(cropNameLabel)
//        
//        // Apply rounded corners to cropImageView
//        cropImageView.layer.cornerRadius = 10
//        cropImageView.layer.masksToBounds = true
//        
//        NSLayoutConstraint.activate([
//            background.topAnchor.constraint(equalTo: contentView.topAnchor),
//            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            
//            cropImageView.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
//            cropImageView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
//            cropImageView.widthAnchor.constraint(equalToConstant: 100),
//            cropImageView.heightAnchor.constraint(equalToConstant: 100),
//            
//            cropNameLabel.topAnchor.constraint(equalTo: cropImageView.bottomAnchor, constant: 10),
//            cropNameLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor)
//        ])
//    }
//    
//    func configure(with crop: Product) {
//        cropImageView.image = UIImage(named: crop.imageNames[0])
//        cropNameLabel.text = crop.name
//    }
//
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        
//        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
//            if let background = contentView.viewWithTag(100) {
//                background.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .darkGray : UIColor(white: 0.95, alpha: 1)
//            }
//        }
//    }
//}
import UIKit

class CropCell: UICollectionViewCell {
    @IBOutlet var cropImageView: UIImageView!
    @IBOutlet var cropNameLabel: UILabel!
    
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

        cropImageView = UIImageView()
        cropNameLabel = UILabel()
        
        cropImageView.translatesAutoresizingMaskIntoConstraints = false
        cropNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(background)
        background.addSubview(cropImageView)
        background.addSubview(cropNameLabel)
        
        // Apply rounded corners to cropImageView
        cropImageView.layer.cornerRadius = 10
        cropImageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            cropImageView.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            cropImageView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            cropImageView.widthAnchor.constraint(equalToConstant: 100),
            cropImageView.heightAnchor.constraint(equalToConstant: 100),
            
            cropNameLabel.topAnchor.constraint(equalTo: cropImageView.bottomAnchor, constant: 10),
            cropNameLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor)
        ])
    }
    
    func configure(with crop: Product) {
        cropImageView.image = UIImage(named: crop.imageNames[0])
        cropNameLabel.text = crop.name
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
