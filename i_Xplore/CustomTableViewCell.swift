//
//  CustomTableViewCell.swift
//  i_Xplore
//
//  Created by Justin on 6/9/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    
    @IBAction func ratingMade(sender: UIButton) {
        
        let image = UIImage(named: "star_pink.png") as UIImage?
        switch sender.tag{
        case 1:
            star1.setImage(image, forState: UIControlState.Normal)
        case 2:
            star1.setImage(image, forState: UIControlState.Normal)
            star2.setImage(image, forState: UIControlState.Normal)
        case 3:
            star1.setImage(image, forState: UIControlState.Normal)
            star2.setImage(image, forState: UIControlState.Normal)
            star3.setImage(image, forState: UIControlState.Normal)
        case 4:
            star1.setImage(image, forState: UIControlState.Normal)
            star2.setImage(image, forState: UIControlState.Normal)
            star3.setImage(image, forState: UIControlState.Normal)
            star4.setImage(image, forState: UIControlState.Normal)
        case 5:
            star1.setImage(image, forState: UIControlState.Normal)
            star2.setImage(image, forState: UIControlState.Normal)
            star3.setImage(image, forState: UIControlState.Normal)
            star4.setImage(image, forState: UIControlState.Normal)
            star5.setImage(image, forState: UIControlState.Normal)
        default:
            break
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // code common to all your cells goes here
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
