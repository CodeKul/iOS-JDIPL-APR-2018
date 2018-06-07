//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Varun on 04/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var mytableView : UITableView!
    var employees : [Employee]?
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        employees = []
        
        let fetchReq = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try appDelegate.persistentContainer.viewContext.fetch(fetchReq)
            for comp in companies {
                let emps = comp.employees?.allObjects as! [Employee]
                print(comp.name! + "\n")
                for emp in emps {
                    print(emp.empId! + "\n" + emp.name!)
                    print(emp.designation! + "\n" + (emp.company?.name)! + "\n")
                }
            }
        }
        catch {
            print(error)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getDataFromDBAndReloadTable()
    }
    
    func getDataFromDBAndReloadTable() {
        
        employees?.removeAll()
        let fetchReq = NSFetchRequest<Employee>(entityName: "Employee")
        do {
            employees = try appDelegate.persistentContainer.viewContext.fetch(fetchReq)
            mytableView.reloadData()
        }
        catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return employees!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let employee = employees![indexPath.row]
        
        cell?.textLabel?.text = employee.name
        cell?.detailTextLabel?.text = employee.designation
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddEmployeeViewController") as! AddEmployeeViewController
        vc.employee = employees![indexPath.row]
        
        self.present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

