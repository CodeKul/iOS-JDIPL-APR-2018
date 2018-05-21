//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Varun on 10/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var arrData : [String]?
    var arrNumbers : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrData = ["Red", "Green", "Blue", "Yellow", "Brown", "Pink", "Gray", "Black", "White"]
        arrNumbers = ["One", "Two", "Three", "Flour", "Five"]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return (arrData?.count)!
        }
        return (arrNumbers?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return arrData![row]
        }
        return arrNumbers![row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            print(arrData![row])
        }
        else {
            print(arrNumbers![row])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

