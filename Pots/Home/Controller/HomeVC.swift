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
        return cell
    }
}

