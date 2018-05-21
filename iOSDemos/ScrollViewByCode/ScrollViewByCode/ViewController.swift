//
//  ViewController.swift
//  ScrollViewByCode
//
//  Created by Varun on 17/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myScrollView = UIScrollView(frame: CGRect(x: 0, y: 20, width: 320, height: 548))
        self.view.addSubview(myScrollView)
        
        let myContentView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 800))
        myScrollView.addSubview(myContentView)
        
        myScrollView.backgroundColor = UIColor.red
        myContentView.backgroundColor = UIColor.lightGray
        
        let lbl1 = UILabel(frame: CGRect(x: 0, y: 8, width: 320, height: 30))
        lbl1.text = "Top"
        lbl1.textAlignment = .center
        myContentView.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect(x: 0, y: 385, width: 320, height: 30))
        lbl2.text = "Center"
        lbl2.textAlignment = .center
        myContentView.addSubview(lbl2)

        let lbl3 = UILabel(frame: CGRect(x: 0, y: 762, width: 320, height: 30))
        lbl3.text = "Bottom"
        lbl3.textAlignment = .center
        myContentView.addSubview(lbl3)
        
        myScrollView.contentSize = myContentView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

