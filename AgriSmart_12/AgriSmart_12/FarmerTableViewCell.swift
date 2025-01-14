import UIKit

class FarmerTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingStackView: UIStackView! // Stack view for stars
    @IBOutlet weak var viewProfileButton: UIButton!

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
//        profileImageView.clipsToBounds = true
//        viewProfileButton.layer.cornerRadius = 8
//    }

    func configure(with farmer: User) {
        // Set profile image or use a default image if none is available
        if let imageUrl = farmer.profile.profileImageUrl, let image = UIImage(named: imageUrl) {
            profileImageView.image = image
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage") // Default image
        }
        
        // Set the name of the farmer
        nameLabel.text = farmer.profile.name
        
        // Set distance label to a placeholder text (as no distance is available in the model)
        distanceLabel.text = "Distance not available"
        
        // Set the rating stars in the stack view
//        for (index, star) in ratingStackView.arrangedSubviews.enumerated() {
//            if let starImage = star as? UIImageView {
//                let starImageName = index < Int(farmer.metrics.rating) ? "star.fill" : "star"
//                starImage.image = UIImage(systemName: starImageName)
//            }
//        }
        
    }
}
