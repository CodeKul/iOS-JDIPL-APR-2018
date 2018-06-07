//
//  ViewController.swift
//  GesturesDemo
//
//  Created by Varun on 25/05/18.
//  Copyright © 2018 Varun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let longPressGes = UILongPressGestureRecognizer(target: self, action: #selector(view3LongPressed))
        longPressGes.minimumPressDuration = 2
        view3.addGestureRecognizer(longPressGes)
    }
    
    @objc func view3LongPressed(_ sender : UILongPressGestureRecognizer) {
        view3.backgroundColor = UIColor.brown
        
        print(sender.location(in: self.view))
    }
    
    @IBAction func view2Swipped(_ sender: UISwipeGestureRecognizer) {
        
        view1.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func view3EdgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        if sender.edges == .left {
            view1.backgroundColor = UIColor.blue
        }
        else {
            view1.backgroundColor = UIColor.cyan
        }
    }

    
    @IBAction func view2Rotated(_ sender: UIRotationGestureRecognizer) {
        
        view2.backgroundColor = UIColor.red
    }

    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        
        view1.backgroundColor = UIColor.red
    }
    
    @IBAction func viewPiched(_ sender: UIPinchGestureRecognizer) {
        
        view1.backgroundColor = UIColor.green
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        print("touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

