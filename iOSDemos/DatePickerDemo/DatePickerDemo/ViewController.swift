//
//  ViewController.swift
//  DatePickerDemo
//
//  Created by Varun on 10/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblSelectedDate : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func datePickerValueChanged (_ sender : UIDatePicker) {
        
        let df = DateFormatter()
        df.dateFormat = "dd-MM-YYYY hh:mm:ss a"
        df.date(from: "05-05-2018 12:00:00 AM")
        
        lblSelectedDate.text = df.string(from: sender.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

