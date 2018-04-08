//
//  PostVC.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class PostVC: UIViewController {

    var titleText: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        UINavigationBar.appearance().barTintColor = UIColor.black
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func keyTapped(sender: UIButton) {
        present((sender.titleLabel?.text)!)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func present(_ title: String) {
        self.titleText = title
        performSegue(withIdentifier: "Post2Price", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Post2Price" {
            if let vc = segue.destination as? AddPriceVC {
                
                vc.titleText = self.titleText
            }
        }
    }
}
