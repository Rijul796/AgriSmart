//
//import UIKit
//
//protocol FarmerTableViewCellDelegate: AnyObject {
//    func viewProfileButtonTapped(farmer: User)
//}
//
//class FarmerTableViewCell: UITableViewCell {
//    @IBOutlet weak var profileImageView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var viewProfileButton: UIButton!
//    @IBOutlet weak var ratingLabel: UILabel!
//    
//    weak var delegate: FarmerTableViewCellDelegate?
//    private var farmer: User?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
//        profileImageView.layer.masksToBounds = true
//        profileImageView.layer.borderWidth = 2.0
//        profileImageView.layer.borderColor = UIColor.systemBlue.cgColor
//        profileImageView.contentMode = .scaleAspectFill
//    }
//
//    func configure(with farmer: User) {
//        self.farmer = farmer
//        if let imageName = farmer.profile.profileImageUrl, let image = UIImage(named: imageName) {
//            profileImageView.image = image
//        } else {
//            profileImageView.image = UIImage(named: "defaultProfileImage")
//        }
//
//        nameLabel.text = farmer.profile.name
//        distanceLabel.text = "Distance not available"
//
//        viewProfileButton.addTarget(self, action: #selector(viewProfileButtonTapped), for: .touchUpInside)
//        
//        ratingLabel.text="\(farmer.metrics.rating) ⭐️"
//    }
//
//    @objc private func viewProfileButtonTapped() {
//        guard let farmer = farmer else { return }
//        delegate?.viewProfileButtonTapped(farmer: farmer)
//    }
//}
import UIKit

protocol FarmerTableViewCellDelegate: AnyObject {
    func viewProfileButtonTapped(farmer: User)
}

class FarmerTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    weak var delegate: FarmerTableViewCellDelegate?
    private var farmer: User?

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.systemBlue.cgColor
        profileImageView.contentMode = .scaleAspectFill
    }

    func configure(with farmer: User) {
        self.farmer = farmer
        if let imageName = farmer.profile.profileImageUrl, let image = UIImage(named: imageName) {
            profileImageView.image = image
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        }

        nameLabel.text = farmer.profile.name
        distanceLabel.text = "Distance not available"
        ratingLabel.text = "\(farmer.metrics.rating) ⭐️"

        // Add target for the button here
        viewProfileButton.addTarget(self, action: #selector(viewProfileButtonTapped), for: .touchUpInside)
    }

    @objc func viewProfileButtonTapped() {
        guard let farmer = farmer else { return }
        delegate?.viewProfileButtonTapped(farmer: farmer)
    }
}
