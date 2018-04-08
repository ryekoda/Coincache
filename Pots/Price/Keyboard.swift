//
//  Keyboard.swift
//  keyboard
//
//  Created by otto on 4/7/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import UIKit

protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
    func doneWasTapped()
}

class Keyboard: UIView {
    
    weak var delegate: KeyboardDelegate?
    
    @IBAction func keyTapped(sender: UIButton) {
        if let char = sender.currentTitle {
            self.delegate?.keyWasTapped(character: char)
        }
    }
    
    @IBAction func doneTapped(sender: UIButton) {
       print("hi")
       self.delegate?.doneWasTapped()
    }
    
    // MARK:- keyboard initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    func initializeSubviews() {
        let xibFileName = "NumPad" // xib extention not included
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
}
