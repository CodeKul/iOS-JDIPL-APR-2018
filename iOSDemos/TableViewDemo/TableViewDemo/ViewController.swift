//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Varun on 14/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrData : [String]?
    var arrNumbers : [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        arrData = ["Red", "Green", "Blue", "Yellow", "Brown", "Cyan", "Magenta", "Black", "White", "Gray", "Orange", "Purple", "Voilet"]
        arrNumbers = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Zero", "Ten", "Eleven"]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return (arrData?.count)!
        }
        return (arrNumbers?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Colors"
        }
        return "Numbers"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 == 0 {
            return 60
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        if section == 0 {
            header.text = "Colors"
        }
        else {
            header.text = "Numbers"
        }
        
        header.textAlignment = .center
        header.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }

        if indexPath.section == 0 {
            cell?.textLabel?.text = arrData?[indexPath.row]
            cell?.detailTextLabel?.text = "Color - \(indexPath.row)"
        }
        else {
            cell?.textLabel?.text = arrNumbers![indexPath.row]
            cell?.detailTextLabel?.text = "Numbers - \(indexPath.row)"
        }
        
        cell?.selectionStyle = .blue
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }
        else {
            cell?.accessoryType = .checkmark
        }
        
        if indexPath.section == 0 {
            print(arrData![indexPath.row])
        }
        else {
            print(arrNumbers![indexPath.row])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

