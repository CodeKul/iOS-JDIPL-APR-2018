//
//  FirstViewController.swift
//  XIBDemo
//
//  Created by Varun on 30/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
    
    @IBAction func nextButtonTouchUpInside (_ sender: UIButton) {
        let SVC = SecondViewController(nibName: "SecondViewController", bundle: nil)
        SVC.strData = txt.text
        
        self.navigationController?.pushViewController(SVC, animated: true)
    }
}
