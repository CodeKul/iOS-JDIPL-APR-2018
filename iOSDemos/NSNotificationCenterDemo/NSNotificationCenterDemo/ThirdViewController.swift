//
//  ThirdViewController.swift
//  NSNotificationCenterDemo
//
//  Created by Varun on 07/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabelData), name: NSNotification.Name("myNotification"), object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    @objc func updateLabelData(_ sender : Notification) {
        print("ThirdViewController : updateLabelData")
    }

    @IBAction func backButtonTouchUpInside(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("myNotification"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
