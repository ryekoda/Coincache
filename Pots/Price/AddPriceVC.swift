//
//  AddPriceVC.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class AddPriceVC: UIViewController {

    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.priceTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
