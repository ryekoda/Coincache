//
//  RoundButton.swift
//  Pots
//
//  Created by Jade S on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundButton: UIButton {

    @IBInspectable var cornerRadiusBtn: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    //programmatic buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    //storyboard buttons
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    //called for rendering @IBDesignable controls
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        //Logic stuffs
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
}
