//
//  ViewController.swift
//  NewsFeedsDemo
//
//  Created by Varun on 12/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {

    @IBOutlet var newsTableView : UITableView!
    var arrNews : [[String : String]]?
    var news : [String : String]?
    var data : String?
    var parser : XMLParser?

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndReloadTable()
    }
    
    func getDataAndReloadTable() {
        
        let url = URL(string: "https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms")
        parser = XMLParser(contentsOf: url!)
        parser?.delegate = self
        parser?.parse()
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Parsing started...")
        arrNews = [[String : String]]()
        news = [String : String]()
        data = String()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "channel" {
            arrNews?.removeAll()
        }
        else if elementName == "item" {
            news?.removeAll()
        }
        else {
            data = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        data?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "channel" {
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
        else if elementName == "item" {
            arrNews?.append(news!)
        }
        else {
            news![elementName] = data
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("Parsing finished...")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrNews!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let news = arrNews![indexPath.row]
        cell?.textLabel?.text = news["title"]
        cell?.detailTextLabel?.text = news["pubDate"]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.link = arrNews![indexPath.row]["link"]
        self.present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

