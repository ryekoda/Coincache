//
//  AddPriceVC.swift
//  Pots
//
//  Created by Ryan on 4/7/18.
//  Copyright © 2018 pots. All rights reserved.
//

import UIKit
import SVProgressHUD

class AddPriceVC: UIViewController, KeyboardDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    
    var titleText: String?
    let hardPhrases = ["Before the result, comes the experiment.", "The distance between insanity and genius is measured only by success.", "Success is most often achieved by those who don't know that failure is inevitable.", "The whole secret of a successful life is to find out what is one's destiny to do, and then do it.", "If you are not willing to risk the usual, you will have to settle for the ordinary.", "Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning."]
    let easyPhrases = ["Great start!", "Give it a try!", "Go for it!", "It's worth a shot!", "What are you waiting for?.", "I'm so proud of you!", "It's your call!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyBoard()
        setupView()
    }
    
    fileprivate func setupView() {
        self.priceTextField.becomeFirstResponder()
        
        guard let title = titleText else {
            return
        }
        if title == "Gain" {
            titleLabel.text = hardPhrases[Int(arc4random_uniform(UInt32(hardPhrases.count-1)))]
        } else {
            titleLabel.text = easyPhrases[Int(arc4random_uniform(UInt32(easyPhrases.count-1)))]
        }
        self.title = titleText
    }
    
    fileprivate func setupKeyBoard() {
        let keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
        keyboardView.delegate = self
        priceTextField.inputView = keyboardView
    }
    
    func keyWasTapped(character: String) {
        if character == "<" {
            priceTextField.deleteBackward()
        } else {
            priceTextField.insertText(character)
        }
    }
    func doneWasTapped() {
        dismissKeyboard()
        if let price = self.priceTextField.text, !price.isEmpty {
            
           SVProgressHUD.showSuccess(withStatus: "Added $\(price) successfully!")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
extension AddPriceVC: UITextFieldDelegate {
    
    func dismissKeyboard () {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
