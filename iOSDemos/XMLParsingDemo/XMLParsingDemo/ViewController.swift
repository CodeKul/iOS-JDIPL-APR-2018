//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by Varun on 12/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, XMLParserDelegate {

    @IBOutlet var plantTableView : UITableView!
    var arrPlants : [[String : String]]?
    var plant : [String : String]?
    var data : String?
    var parser : XMLParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndReloadTable()
    }
    
    func getDataAndReloadTable() {
        
        let url = URL(string: "http://www.chilkatsoft.com/xml-samples/plants.xml")
        parser = XMLParser(contentsOf: url!)
        parser?.delegate = self
        parser?.parse()
    }

    func parserDidStartDocument(_ parser: XMLParser) {
        print("Parsing started...")
        arrPlants = [[String : String]]()
        plant = [String : String]()
        data = String()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "CATALOG" {
            arrPlants?.removeAll()
        }
        else if elementName == "PLANT" {
            plant?.removeAll()
        }
        else {
            data = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        data?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "CATALOG" {
            DispatchQueue.main.async {
                self.plantTableView.reloadData()
            }
        }
        else if elementName == "PLANT" {
            arrPlants?.append(plant!)
        }
        else {
            plant![elementName] = data
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("Parsing finished...")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return arrPlants!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let plant = arrPlants![indexPath.row]
        cell?.textLabel?.text = plant["COMMON"]
        cell?.detailTextLabel?.text = plant["PRICE"]
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

