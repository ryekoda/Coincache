//
//  ProfileViewController.swift
//  Pots
//
//  Created by otto on 4/8/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var usdAmount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usdAmount.text = "\(userCash)"
        
    }

    

}
