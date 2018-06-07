//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Varun on 17/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var myWebView : WKWebView!
    @IBOutlet var progressView : UIProgressView!
    @IBOutlet var urlTxt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        progressView.progress = 0
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(myWebView.estimatedProgress)
            if progressView.progress == 1 {
                progressView.isHidden = true
            }
            else {
                progressView.isHidden = false
            }
            urlTxt.text = myWebView.url?.absoluteString
        }
    }

    @IBAction func goButtonTouchUpInside (_ sender : UIButton) {
        var strUrl = ""
        if (urlTxt.text?.starts(with: "http://"))! {
            strUrl = urlTxt.text!
        }
        else {
            strUrl = "http://\(urlTxt.text!)"
        }
        let url = URL(string: strUrl)
        let req = URLRequest(url: url!)
        myWebView.load(req)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

