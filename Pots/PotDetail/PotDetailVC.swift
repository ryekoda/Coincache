//
//  PotDetailVC.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit

class PotDetailVC: UIViewController, JoinGroupDelegate {
    func joinGroupButtonWasTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PriceVC")
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private struct identifiers {
        static let detailOverviewCell = "DetailOverviewCell"
        static let detailGeneralCell = "DetailGeneralCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
    }
    
    func prepareUI() {
        self.tableViewConfiguration()
    }
    
    private func tableViewConfiguration() {
        let nib = UINib(nibName: "DetailOverviewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "DetailOverviewCell")
        
        let generalNib = UINib(nibName: "DetailGeneralCell", bundle: nil)
        self.tableView.register(generalNib, forCellReuseIdentifier: "DetailGeneralCell")
    }
}

extension PotDetailVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Contributors"
        } else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 160.0
            }
        } else {
            return 50.0
        }
        
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let overViewCell = tableView.dequeueReusableCell(withIdentifier: identifiers.detailOverviewCell, for: indexPath) as! DetailOverviewCell
            overViewCell.delegate = self
            return overViewCell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.detailGeneralCell, for: indexPath) as! DetailGeneralCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.detailGeneralCell, for: indexPath) as! DetailGeneralCell
            return cell
        }
    }
}
