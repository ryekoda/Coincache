//
//  ProfileViewController.swift
//  Pots
//
//  Created by otto on 4/8/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

var userCash: Double = 50.00
var btc: Double = 0.0

var beforeUserCash: Double = 0.00
var beforeBtc: Double = 0.12


class ProfileViewController: UIViewController {

    var currentCash: Double = 0.0;
    var currentBtc: Double = 0.0;
    
    @IBOutlet weak var usdAmount: UILabel!
    @IBOutlet weak var btcAmount: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notiName = Notification.Name("pushNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(self.handlePriceDown), name: notiName, object: nil)
        
        setNavigationBar()
        
    }
    
    func setNavigationBar() {
    
    let screenSize: CGRect = UIScreen.main.bounds
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 154))
    let navItem = UINavigationItem(title: "")
    let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
    navItem.leftBarButtonItem = doneItem
    navBar.setItems([navItem], animated: false)
    self.view.addSubview(navBar)
    
//    let height: CGFloat = 50 //whatever height you want to add to the existing height
//    let bounds = self.navigationController!.navigationBar.bounds
//    self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }
    
    @objc func done() { // remove @objc for Swift 3
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usdAmount.text = String(format: "%.2f", beforeUserCash)
        btcAmount.text = String(format: "%.2f", beforeBtc)
    }

    @objc func handlePriceDown() {
        
        print("We are good!!!")
        
        //usdAmount.text = String(format: "%.2f", userCash)
        //btcAmount.text = String(format: "%.2f", btc)
        
        currentCash = 0
        currentBtc = 0.12
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.animateNumberChange()
        })
    }
    
    func animateNumberChange() {
        currentCash = currentCash + 1;
        if (currentCash <= 50) {
            usdAmount.text = String(format: "%.2f", currentCash)
        }
        
        currentBtc = currentBtc - 0.01;
        if (currentBtc >= 0) {
            btcAmount.text = String(format: "%.2f", currentBtc)
        }

        if (currentCash < 50) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.animateNumberChange()
            })
        }
    }

}
