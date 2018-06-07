//
//  ImageViewController.swift
//  MultiThreadingDemo
//
//  Created by Varun on 06/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var myImageView : UIImageView!
    @IBOutlet var loader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.startAnimating()
        
        let myQueue1 = DispatchQueue(label: "myQueue1")
        let myQueue2 = DispatchQueue(label: "myQueue2")
        
        myQueue1.async {
            sleep(1)
            print(myQueue1.label)
        }
        
        myQueue2.async {
            sleep(1)
            print(myQueue2.label)
        }

        DispatchQueue.global().async {
            let image = try! UIImage(data: Data(contentsOf: URL(string: "https://vignette.wikia.nocookie.net/deathbattlefanon/images/b/b7/Epic_Iron_Man.png/revision/latest?cb=20150404070629")!))
            
            DispatchQueue.main.async {
                self.myImageView.image = image
                self.loader.stopAnimating()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
