//
//  DetailOverviewCell.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class DetailOverviewCell: UITableViewCell {

    
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var joinGroupButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.groupImageView.layer.cornerRadius = self.groupImageView.frame.size.width / 2
        self.groupImageView.clipsToBounds = true
        self.groupImageView.layer.borderColor = UIColor.black.cgColor
        self.groupImageView.layer.borderWidth = 0.5
        
        self.joinGroupButton.layer.cornerRadius = 20.0
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
