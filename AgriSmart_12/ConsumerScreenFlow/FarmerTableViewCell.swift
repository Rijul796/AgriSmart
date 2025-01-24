import UIKit

protocol FarmerTableViewCellDelegate: AnyObject {
    func viewProfileButtonTapped(farmer: User)
}

class FarmerTableViewCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // Delegate and Farmer data
    weak var delegate: FarmerTableViewCellDelegate?
    private var farmer: User?

    // Lifecycle: Initial setup
    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfileImageView()
    }

    // Configure the cell with farmer data
    func configure(with farmer: User) {
        self.farmer = farmer

        // Configure profile image
        if let imageName = farmer.profile.profileImageUrl, let image = UIImage(named: imageName) {
            profileImageView.image = image
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        }

        // Configure labels
        nameLabel.text = farmer.profile.name
        distanceLabel.text = "Distance: 9.99 KM" // Update logic if distance is available
        ratingLabel.text = "\(farmer.metrics.rating) ⭐️"

        // Clean previous targets and add action for button
        viewProfileButton.removeTarget(nil, action: nil, for: .allEvents)
        viewProfileButton.addTarget(self, action: #selector(viewProfileButtonTapped), for: .touchUpInside)
    }

    // Handle the button action
    @objc func viewProfileButtonTapped() {
        guard let farmer = farmer else { return }
        delegate?.viewProfileButtonTapped(farmer: farmer)
    }

    // Lifecycle: Prepare cell for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        // Remove targets to avoid duplication when reusing cells
        viewProfileButton.removeTarget(nil, action: nil, for: .allEvents)
    }

    // Helper: Setup profile image styling
    private func setupProfileImageView() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.systemBlue.cgColor
        profileImageView.contentMode = .scaleAspectFill
    }
}
