//
//  ViewController.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {

    var refreshControl: UIRefreshControl!
    @IBOutlet weak var tableView: UITableView!
    
//<<<<<<< HEAD
    var potList: [Dictionary<String, Any>] = []
    var prices = ["201,702.52", "50,080.75", "29,100.89", "91,730.22", "1,290.73"]
    var contributorProfiles = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11"]
    var contributorsNames = ["Ryan", "Jade", "Dima", "Farn-yu", "Frank", "Blake", "Adam", "Ashley", "Pat", "Lisi"]
    var stashTimes = ["24h left", "12h left", "5h left", "Closed", "Closed"]
//=======
    private struct identifiers {
        static let generalCell = "HomeGeneralCell"
    }
    
//    var userPotList: [String] = []
//>>>>>>> bea827df83e4009142dc0751b9cd084059bea9a0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        
        Alamofire.request("http://192.168.100.233:3000/pots").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                let dd = json as? [Dictionary<String, Any>]
                self.potList = dd!
                self.tableView.reloadData()
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
        print("Goodbye, world!")
        
//        Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
//            .responseJSON { response in
//                debugPrint(response)     // prints detailed description of all response properties
//
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }
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
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(self.tableRefreshed), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
    
    @objc func tableRefreshed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Home2Detail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.potList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.generalCell, for: indexPath) as! HomeGeneralCell
        
        let pot = self.potList[indexPath.row] as? Dictionary<String, Any>
        cell.potPriceLabel.text = "$\(pot!["amount"] as! Int)"
//        cell.potPriceLabel.text = "$\(self.prices[indexPath.row])"
        let newOrderProfiles = self.contributorProfiles.shuffled()

        cell.contributorsContainerView.contributorImageView1.image = UIImage(named: "\(newOrderProfiles[0])")
        cell.contributorsContainerView.contributorImageView2.image = UIImage(named: "\(newOrderProfiles[1])")
        cell.contributorsContainerView.contributorImageView3.image = UIImage(named: "\(newOrderProfiles[2])")
        cell.contributorsContainerView.contributorImageView4.image = UIImage(named: "\(newOrderProfiles[3])")
        cell.contributorsContainerView.contributorImageView5.image = UIImage(named: "\(newOrderProfiles[4])")
        cell.contributorsContainerView.contributorImageView6.image = UIImage(named: "\(newOrderProfiles[5])")
        cell.contributorsContainerView.contributorImageView7.image = UIImage(named: "\(newOrderProfiles[6])")
        cell.contributorsContainerView.contributorImageView8.image = UIImage(named: "\(newOrderProfiles[7])")
        cell.contributorsContainerView.contributorImageView9.image = UIImage(named: "\(newOrderProfiles[8])")
        cell.contributorsContainerView.contributorImageView10.image = UIImage(named: "\(newOrderProfiles[9])")

        let newOrderNames = self.contributorsNames.shuffled()
        var firstFive = newOrderNames[0..<3]
        let jjj = firstFive.joined(separator: ", ")
//        let stringRepresentation = ", ".join(firstFive)
        cell.contributorsNamesLabel.text = "\(jjj), +7 others"
        cell.timeLeftLabel.text = self.stashTimes[indexPath.row]
        
        if self.stashTimes[indexPath.row] == "Closed" {
            cell.timeLeftLabel.textColor = UIColor.red
            cell.timeLeftLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        }
        return cell
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

