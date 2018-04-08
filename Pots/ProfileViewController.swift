//
//  ProfileViewController.swift
//  Pots
//
//  Created by otto on 4/8/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

var userCash: Double = 50.00
var btc: Double = 0.12


class ProfileViewController: UIViewController {

    @IBOutlet weak var usdAmount: UILabel!
    @IBOutlet weak var btcAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usdAmount.text = String(format: "%.2f", userCash)
        btcAmount.text = String(format: "%.2f", btc)
    }

    

}
