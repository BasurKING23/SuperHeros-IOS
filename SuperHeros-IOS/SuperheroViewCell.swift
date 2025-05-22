//
//  SuperheroViewCell.swift
//  SuperHeros-IOS
//
//  Created by Mañanas on 22/5/25.
//

import UIKit

class SuperheroViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func render (superhero: Superhero) {
        nameLabel.text = superhero.name
        avatarImageView.loadFrom(url: superhero.image.url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.layer.cornerRadius = 16
        cardView.layer.masksToBounds = true
        
        shadowView.layer.cornerRadius = 16
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 4, height: 4)
        shadowView.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
