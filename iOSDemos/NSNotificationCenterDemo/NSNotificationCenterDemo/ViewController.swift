//
//  ViewController.swift
//  NSNotificationCenterDemo
//
//  Created by Varun on 07/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabelData), name: NSNotification.Name("myNotification"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("myNotification"), object: nil)
    }
    
    @objc func updateLabelData(_ sender : Notification) {
        lbl.text = (sender.object as! String)
        print("ViewController : updateLabelData")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

