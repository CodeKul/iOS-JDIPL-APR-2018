//
//  ViewController.swift
//  ColorPicker
//
//  Created by Varun on 07/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var colorView : UIView!
    @IBOutlet var txtRed : UITextField!
    @IBOutlet var txtGreen : UITextField!
    @IBOutlet var txtBlue : UITextField!
    @IBOutlet var sliderRed : UISlider!
    @IBOutlet var sliderGreen : UISlider!
    @IBOutlet var sliderBlue : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sliderValueChanged (_ sender : UISlider) {
        
        if sender.tag == 1 {
            //Red
            txtRed.text = "\(Int(sender.value))"
        }
        else if sender.tag == 2 {
            //Green
            txtGreen.text = "\(Int(sender.value))"
        }
        else {
            //Blue
            txtBlue.text = "\(Int(sender.value))"
        }
        setBackgroundColorToView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtRed {
            sliderRed.value = Float(txtRed.text!)!
        }
        else if textField == txtGreen {
            sliderGreen.value = Float(txtGreen.text!)!
        }
        else if textField == txtBlue {
            sliderBlue.value = Float(txtBlue.text!)!
        }
        setBackgroundColorToView()
        return textField.resignFirstResponder()
    }
    
    func setBackgroundColorToView() {
        
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value/255.0), green: CGFloat(sliderGreen.value/255.0), blue: CGFloat(sliderBlue.value/255.0), alpha: 1)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

