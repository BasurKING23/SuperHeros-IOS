//
//  DetailViewController.swift
//  SuperheroLeague-iOS
//
//  Created by Mañanas on 21/5/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    var superhero: Superhero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.layer.masksToBounds = true
        
        shadowView.layer.cornerRadius = 16
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 4, height: 4)
        shadowView.layer.shadowOpacity = 0.5
        

        // Do any additional setup after loading the view.
        avatarImageView.loadFrom(url: superhero.image.url)
        
        realNameLabel.text = superhero.biography.realName
        publisherLabel.text = superhero.biography.publisher
        placeOfBirthLabel.text = superhero.biography.placeOfBirth
        alignmentLabel.text = superhero.biography.alignment
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
