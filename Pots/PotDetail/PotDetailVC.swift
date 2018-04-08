//
//  PotDetailVC.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit
import Alamofire

class PotDetailVC: UIViewController, JoinGroupDelegate {
    
    
    var contributorProfiles = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11"]
    var contributorsNames = ["Ryan", "Jade", "Dima", "Farn-yu", "Frank", "Blake", "Adam", "Ashley", "Pat", "Lisi"]
    
    var newOrderProfiles: [String] = []
    var nam: [String] = []
    
    func profileTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProfileVC")
//        self.present(controller, animated: true, completion: nil)
//        
//        let profileVC = ProfileViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func joinGroupButtonWasTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PriceVC")
        self.present(controller, animated: true, completion: nil)
        
        //
        Alamofire.request("http://192.168.100.233:3000/pots/join").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                let dd = json as? [Dictionary<String, Any>]
                print("Gaoolll = \(dd)")
//                self.potList = dd!
//                self.tableView.reloadData()
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
        print("Hello, world!")
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private struct identifiers {
        static let detailOverviewCell = "DetailOverviewCell"
        static let detailGeneralCell = "DetailGeneralCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        
        self.newOrderProfiles = self.contributorProfiles.shuffled()
        self.nam = self.contributorsNames.shuffled()
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
        
            cell.profileImage.image = UIImage(named: "\(self.newOrderProfiles[indexPath.row])")
            cell.profileNameLabel.text = self.nam[indexPath.row]
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.detailGeneralCell, for: indexPath) as! DetailGeneralCell
            return cell
        }
    }
}
