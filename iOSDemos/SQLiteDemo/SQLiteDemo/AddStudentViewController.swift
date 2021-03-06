//
//  AddStudentViewController.swift
//  SQLiteDemo
//
//  Created by Varun on 31/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    @IBOutlet weak var txtMarks: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtRno: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        // INSERT INTO table_name VALUES(value1, value2...)
        
        if appDelegate.executeQuery("INSERT INTO Student VALUES (\(txtRno.text!), '\(txtName.text!)', \(txtMarks.text!))") {
            
            print("Student added")
            self.dismiss(animated: true, completion: nil)
        }
        else {
            print("Error while adding student")
        }
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        
        if let rno = txtRno.text {
            
            let arrData = appDelegate.selectQuery("SELECT * FROM Student WHERE roll_no=\(rno)")
            
            if arrData.count != 0 {
                let message = "Roll no.: \(arrData.first!["roll_no"] as! String)\nName: \(arrData.first!["name"] as! String)\nMarks: \(arrData.first!["marks"] as! String)"
                
                let alert = UIAlertController(title: "Do you really wants to delete?", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (yes) in
                    if self.appDelegate.executeQuery("DELETE FROM Student WHERE roll_no=\(rno)") {
                        
                        print("Student deleted")
                        self.dismiss(animated: true, completion: nil)
                    }
                    else {
                        print("Error while deleting student")
                    }
                }))
                
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (no) in
                    
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func updateButtonClicked(_ sender: UIButton) {
        
        if let rno = txtRno.text {
            
            let arrData = appDelegate.selectQuery("SELECT * FROM Student WHERE roll_no=\(rno)")
            
            if arrData.count != 0 {
                let message = "Roll no.: \(arrData.first!["roll_no"] as! String)\nName: \(txtName.text!)\nMarks: \(txtMarks.text!)"
                
                let alert = UIAlertController(title: "Following record will update\nDo you want to continue?", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (yes) in
                    if self.appDelegate.executeQuery("UPDATE Student SET name='\(self.txtName.text!)', marks=\(self.txtMarks.text!) WHERE roll_no=\(rno)") {
                        
                        print("Student updated")
                        self.dismiss(animated: true, completion: nil)
                    }
                    else {
                        print("Error while uapdating student")
                    }
                }))
                
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (no) in
                    
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
