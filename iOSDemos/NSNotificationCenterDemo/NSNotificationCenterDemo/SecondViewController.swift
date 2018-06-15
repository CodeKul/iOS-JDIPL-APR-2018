//
//  SecondViewController.swift
//  NSNotificationCenterDemo
//
//  Created by Varun on 07/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var txt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func backButtonTouchUpInside(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendDataButtonTouchupInside (_ sender : UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("myNotification"), object: txt.text)
    }
}
