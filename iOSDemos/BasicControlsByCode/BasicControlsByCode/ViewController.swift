//
//  ViewController.swift
//  BasicControlsByCode
//
//  Created by Varun on 07/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myLabel : UILabel?
    var myTextField : UITextField?
    var mySlider : UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel = UILabel(frame: CGRect(x: 16, y: 20, width: 288, height: 40))
        
        myLabel?.text = "Codekul"
        myLabel?.textColor = #colorLiteral(red: 0.2116611982, green: 0.1808431021, blue: 1, alpha: 1)
        myLabel?.font = UIFont(name: "Chalkduster", size: 30)
        myLabel?.textAlignment = .center
        
        self.view.addSubview(myLabel!)
        
        let myButton = UIButton(frame: CGRect(x: 120, y: 70, width: 80, height: 30))
        myButton.setTitle("Go", for: .normal)
        myButton.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: .normal)
        myButton.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .highlighted)
        myButton.backgroundColor = UIColor.lightGray
        
        myButton.addTarget(self, action: #selector(goButtonTouchUpInside), for: .touchUpInside)
        
        self.view.addSubview(myButton)
        
        myTextField = UITextField(frame: CGRect(x: 16, y: myButton.frame.origin.y + myButton.frame.height + 10, width: 288, height: 30))
        myTextField?.placeholder = "Name"
        
        self.view.addSubview(myTextField!)
        
        let mySegmentedControl = UISegmentedControl(frame: CGRect(x: 16, y: (myTextField?.frame.origin.y)! + (myTextField?.frame.height)! + 10, width: 288, height: 40))
        mySegmentedControl.insertSegment(withTitle: "Red", at: 0, animated: true)
        mySegmentedControl.insertSegment(withTitle: "Green", at: 1, animated: true)
        mySegmentedControl.insertSegment(withTitle: "Blue", at: 2, animated: true)
        
        mySegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        self.view.addSubview(mySegmentedControl)
        
        mySlider = UISlider(frame: CGRect(x: 16, y: mySegmentedControl.frame.origin.y + mySegmentedControl.frame.height + 10, width: 288, height: 40))
        mySlider?.minimumValue = 0
        mySlider?.maximumValue = 100
        mySlider?.value = 0
        
        mySlider?.minimumTrackTintColor = UIColor.green
        mySlider?.maximumTrackTintColor = UIColor.red
        mySlider?.thumbTintColor = UIColor.blue
        
        mySlider?.addTarget(self, action: #selector(mySliderValueChanged), for: .valueChanged)
        
        self.view.addSubview(mySlider!)
        
        let mySwitch = UISwitch(frame: CGRect(x: 135, y: (mySlider?.frame.origin.y)! + (mySlider?.frame.height)! + 10, width: 50, height: 40))
        mySwitch.thumbTintColor = UIColor.blue
        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(switchValueChnaged), for: .valueChanged)
        self.view.addSubview(mySwitch)
    }
    
    @objc func goButtonTouchUpInside(_ sender : UIButton) {
        myLabel?.text = myTextField?.text
    }
    
    @objc func segmentedControlValueChanged (_ sender : UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            myLabel?.textColor = UIColor.red
            sender.tintColor = UIColor.red
        }
        else if sender.selectedSegmentIndex == 1 {
            myLabel?.textColor = UIColor.green
            sender.tintColor = UIColor.green
        }
        else {
            myLabel?.textColor = UIColor.blue
            sender.tintColor = UIColor.blue
        }
    }
    
    @objc func mySliderValueChanged (_ sender : UISlider) {
        myTextField?.text = "\(sender.value)"
    }
    
    @objc func switchValueChnaged (_ sender : UISwitch) {
        mySlider?.isUserInteractionEnabled = sender.isOn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

