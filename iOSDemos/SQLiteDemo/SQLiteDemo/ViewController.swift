//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by Varun on 31/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var addButton : UIButton!
    @IBOutlet var myTableView : UITableView!
    
    var students : [Student]?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = addButton.frame.height/2
        students = []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let arrData = appDelegate.selectQuery("SELECT * FROM Student")
        students?.removeAll()
        
        for data in arrData {
            let student = Student(rno: Int(data["roll_no"] as! String)!, name: data["name"] as! String, marks: Int(data["marks"] as! String)!)
            students?.append(student)
        }
        
        myTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return students!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let student = students![indexPath.row]
        cell?.textLabel?.text = student.name
        cell?.detailTextLabel?.text = "\(student.marks)"
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

