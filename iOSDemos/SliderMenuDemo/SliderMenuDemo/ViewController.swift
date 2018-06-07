//
//  ViewController.swift
//  SliderMenuDemo
//
//  Created by Varun on 25/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func menuButtonTouchUpInside (_ sender : UIButton) {
        
        if menuLeadingConstraint.constant == 0 {
            menuLeadingConstraint.constant = -180
        }
        else {
            menuLeadingConstraint.constant = 0
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func edgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .recognized {
            menuLeadingConstraint.constant = 0
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .recognized {
            menuLeadingConstraint.constant = -180
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

