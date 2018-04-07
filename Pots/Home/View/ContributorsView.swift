//
//  ContributorsView.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class ContributorsView: UIView {
    
    @IBOutlet weak var contributorImageView1: UIImageView!
    @IBOutlet weak var contributorImageView2: UIImageView!
    @IBOutlet weak var contributorImageView3: UIImageView!
    @IBOutlet weak var contributorImageView4: UIImageView!
    @IBOutlet weak var contributorImageView5: UIImageView!
    @IBOutlet weak var contributorImageView6: UIImageView!
    @IBOutlet weak var contributorImageView7: UIImageView!
    @IBOutlet weak var contributorImageView8: UIImageView!
    @IBOutlet weak var contributorImageView9: UIImageView!
    @IBOutlet weak var contributorImageView10: UIImageView!
    
    override func awakeFromNib() {
        let contributorsView = Bundle.main.loadNibNamed("ContributorsView", owner: self, options: nil)!.first as! UIView
        contributorsView.frame = self.bounds
        self.addSubview(contributorsView)
        
        self.contributorImageViewConfiguration()
    }
    
    func contributorImageViewConfiguration() {
        // 1
        self.contributorImageView1.layer.cornerRadius = self.contributorImageView1.frame.size.width / 2
        self.contributorImageView1.layer.borderWidth = 3.0
        self.contributorImageView1.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView1.clipsToBounds = true
        
        // 2
        self.contributorImageView2.layer.cornerRadius = self.contributorImageView2.frame.size.width / 2
        self.contributorImageView2.layer.borderWidth = 3.0
        self.contributorImageView2.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView2.clipsToBounds = true
        
        // 3
        self.contributorImageView3.layer.cornerRadius = self.contributorImageView3.frame.size.width / 2
        self.contributorImageView3.layer.borderWidth = 3.0
        self.contributorImageView3.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView3.clipsToBounds = true
        
        // 4
        self.contributorImageView4.layer.cornerRadius = self.contributorImageView4.frame.size.width / 2
        self.contributorImageView4.layer.borderWidth = 3.0
        self.contributorImageView4.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView4.clipsToBounds = true
        
        // 5
        self.contributorImageView5.layer.cornerRadius = self.contributorImageView5.frame.size.width / 2
        self.contributorImageView5.layer.borderWidth = 3.0
        self.contributorImageView5.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView5.clipsToBounds = true
        
        // 6
        self.contributorImageView6.layer.cornerRadius = self.contributorImageView6.frame.size.width / 2
        self.contributorImageView6.layer.borderWidth = 3.0
        self.contributorImageView6.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView6.clipsToBounds = true
        
        // 7
        self.contributorImageView7.layer.cornerRadius = self.contributorImageView7.frame.size.width / 2
        self.contributorImageView7.layer.borderWidth = 3.0
        self.contributorImageView7.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView7.clipsToBounds = true
        
        // 8
        self.contributorImageView8.layer.cornerRadius = self.contributorImageView8.frame.size.width / 2
        self.contributorImageView8.layer.borderWidth = 3.0
        self.contributorImageView8.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView8.clipsToBounds = true
        
        // 9
        self.contributorImageView9.layer.cornerRadius = self.contributorImageView9.frame.size.width / 2
        self.contributorImageView9.layer.borderWidth = 3.0
        self.contributorImageView9.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView9.clipsToBounds = true
        
        // 10
        self.contributorImageView10.layer.cornerRadius = self.contributorImageView10.frame.size.width / 2
        self.contributorImageView10.layer.borderWidth = 3.0
        self.contributorImageView10.layer.borderColor = UIColor.white.cgColor
        self.contributorImageView10.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
