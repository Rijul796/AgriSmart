import UIKit

protocol FarmerTableViewCellDelegate: AnyObject {
    func viewProfileButtonTapped(farmer: User)
}

class FarmerTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var viewProfileButton: UIButton!

    weak var delegate: FarmerTableViewCellDelegate?
    private var farmer: User?

    func configure(with farmer: User) {
        self.farmer = farmer
        if let imageName = farmer.profile.profileImageUrl, let image = UIImage(named: imageName) {
            profileImageView.image = image
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        }
        
        nameLabel.text = farmer.profile.name
        distanceLabel.text = "Distance not available"
        
        viewProfileButton.addTarget(self, action: #selector(viewProfileButtonTapped), for: .touchUpInside)
    }

    @objc private func viewProfileButtonTapped() {
        guard let farmer = farmer else { return }
        delegate?.viewProfileButtonTapped(farmer: farmer)
    }
}
