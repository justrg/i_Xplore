//
//  CustomTableViewCell.swift
//  i_Xplore
//
//  Created by Justin on 6/9/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var label: UILabel?
    var iView: UIImageView?
    var view: UIView?
    var date: UILabel?
    
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // code common to all your cells goes here
        
        let tVCFrame = CGRectMake(0,0, 361, 200)
        view = UIView(frame: tVCFrame)
        self.addSubview(view!)
        
        let iVFrame = CGRectMake(8, 3, 100, 82)
        iView = UIImageView (frame: iVFrame)
        self.addSubview(iView!)
        
        let labelFrame = CGRectMake(116, 8, 175, 21)
        label = UILabel(frame: labelFrame)
        self.addSubview(label!)
        
        let dateFrame = CGRectMake(116, 25, 150, 21)
        date = UILabel(frame: dateFrame)
        self.addSubview(date!)
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
