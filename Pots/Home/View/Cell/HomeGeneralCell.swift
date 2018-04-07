//
//  HomeGeneralCell.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class HomeGeneralCell: UITableViewCell {
    
    @IBOutlet weak var contributorsLeftConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        self.contributorsLeftConstraint.constant = -13
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
