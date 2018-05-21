//
//  ViewController.swift
//  PassDataFromVCToVC
//
//  Created by Varun on 16/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txt1 : UITextField!
    @IBOutlet var txt2 : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goButtonClicked (_ sender : UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.strData = txt1.text
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromFvcToSvc" {
            
            let vc = segue.destination as! SecondViewController
            vc.strData = txt2.text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txt1 {
            txt2.becomeFirstResponder()
        }
        else {
            txt2.resignFirstResponder()
            self.goButtonClicked(UIButton())
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

