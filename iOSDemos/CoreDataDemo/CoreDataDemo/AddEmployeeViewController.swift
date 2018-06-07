//
//  AddEmployeeViewController.swift
//  CoreDataDemo
//
//  Created by Varun on 04/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import CoreData

class AddEmployeeViewController: UIViewController {

    @IBOutlet var txtId : UITextField!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtDesignation : UITextField!
    @IBOutlet var txtCompId : UITextField!
    @IBOutlet var txtCompName : UITextField!

    var employee : Employee?
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard employee == nil else {
            txtId.text = employee?.empId
            txtName.text = employee?.name
            txtDesignation.text = employee?.designation
            txtId.isEnabled = false
            txtCompName.text = employee?.company?.name
            txtCompId.text = employee?.company?.compId
            return
        }
    }

    @IBAction func saveButtonCLicked(_ sender : UIButton) {
        
        if employee == nil {
            let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: appDelegate.persistentContainer.viewContext) as! Employee
            
            employee.empId = txtId.text
            employee.name = txtName.text
            employee.designation = txtDesignation.text
            
            let fetchReq = NSFetchRequest<Company>(entityName: "Company")
            fetchReq.predicate = NSPredicate(format: "compId == %@", txtCompId.text!)
            var company = try! appDelegate.persistentContainer.viewContext.fetch(fetchReq).first

            if company != nil {
                employee.company = company
            }
            else {
                company = (NSEntityDescription.insertNewObject(forEntityName: "Company", into: appDelegate.persistentContainer.viewContext) as! Company)
                
                company?.compId = txtCompId.text
                company?.name = txtCompName.text
                employee.company = company
            }
        }
        else {
            let fetchReq = NSFetchRequest<Employee>(entityName: "Employee")
            fetchReq.predicate = NSPredicate(format: "empId == %@", txtId.text!)
            let e = try! appDelegate.persistentContainer.viewContext.fetch(fetchReq).first
                        
            e?.name = txtName.text
            e?.designation = txtDesignation.text
            
            let fetchCompReq = NSFetchRequest<Company>(entityName: "Company")
            fetchCompReq.predicate = NSPredicate(format: "compId == %@", txtCompId.text!)
            var company = try! appDelegate.persistentContainer.viewContext.fetch(fetchCompReq).first
            
            if company != nil {
                e?.company = company
            }
            else {
                company = (NSEntityDescription.insertNewObject(forEntityName: "Company", into: appDelegate.persistentContainer.viewContext) as! Company)
                
                company?.compId = txtCompId.text
                company?.name = txtCompName.text
                e?.company = company
            }
        }
        appDelegate.saveContext()
        self.backButtonCLicked(UIButton())
    }
    
    @IBAction func backButtonCLicked(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
