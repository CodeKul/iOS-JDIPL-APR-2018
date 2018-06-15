//
//  SecondViewController.swift
//  CustomDelegateDmeo
//
//  Created by Varun on 13/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txt : UITextField!
    
    var delegate : MyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backButtonTouchUpInside (_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //send data via delegate
        if let delegateObj = delegate {
            if textField.text!.count > 0 {
                delegateObj.textFieldResingedWithText(textField.text!)
            }
            else {
                delegateObj.textFieldResingedWithoutText!()
            }
        }
        
        return textField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
