//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Varun on 28/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var lbl : UILabel!
    @IBOutlet var txt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataFromDB()
    }

    @IBAction func saveButtonPressed(_ sender : UIButton) {
        self.saveDataToDB(txt.text!)
        self.setDataFromDB()
    }
    
    func saveDataToDB(_ data : String) {
        let ud = UserDefaults.standard
        ud.setValue(data, forKey: "Data")
    }
    
    func setDataFromDB() {
        let ud = UserDefaults.standard
        let str = (ud.value(forKey: "Data") as? String)
        lbl.text = str ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

