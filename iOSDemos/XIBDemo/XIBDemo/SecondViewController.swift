//
//  SecondViewController.swift
//  XIBDemo
//
//  Created by Varun on 30/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var lbl : UILabel!
    var strData : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = strData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
