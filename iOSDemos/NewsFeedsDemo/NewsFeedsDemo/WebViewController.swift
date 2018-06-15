//
//  WebViewController.swift
//  NewsFeedsDemo
//
//  Created by Varun on 12/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var link : String?
    
    @IBOutlet var newsWebView : WKWebView!
    @IBOutlet var loader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: link!)
        let request = URLRequest(url: url!)
        newsWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        loader.startAnimating()
        newsWebView.load(request)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            if newsWebView.estimatedProgress == 1 {
                loader.stopAnimating()
            }
        }
    }
    
    @IBAction func closeButtonClicked (_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
