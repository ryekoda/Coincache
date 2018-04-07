//
//  ViewController.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
//    var userPotList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if self.userPotList.isEmpty {
//            self.tableView.isHidden = true
//        }
    }
    
    func prepareUI() {
        self.tableViewConfiguration()
    }
    
    private func tableViewConfiguration() {
        let nib = UINib(nibName: "HomeGeneralCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HomeGeneralCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Home2Detail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    private struct identifiers {
        static let generalCell = "HomeGeneralCell"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.generalCell, for: indexPath) as! HomeGeneralCell
        return cell
    }
}

