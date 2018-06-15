//
//  ViewController.swift
//  CustomDelegateDmeo
//
//  Created by Varun on 13/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyDelegate {

    @IBOutlet var lbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func textFieldResingedWithText(_ text: String) {
        lbl.text = text
    }
    
    func textFieldResingedWithoutText() {
        lbl.text = "Text is not available"
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender : UIButton) {
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        VC.delegate = self
        self.present(VC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

