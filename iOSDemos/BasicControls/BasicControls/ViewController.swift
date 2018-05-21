//
//  ViewController.swift
//  BasicControls
//
//  Created by Varun on 04/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func segentedControlValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            myLabel.textColor = UIColor.red
        }
        else if sender.selectedSegmentIndex == 1 {
            myLabel.textColor = UIColor.green
        }
        else {
            myLabel.textColor = UIColor.blue
        }
    }
    
    @IBAction func goButtonTouchUpInside(_ sender: UIButton) {
        myLabel.text = myTextField.text
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        myTextField.text = "\(sender.value)"
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        mySlider.isUserInteractionEnabled = sender.isOn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

