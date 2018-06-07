//
//  ViewController.swift
//  MultimediaDemo
//
//  Created by Varun on 30/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var player : AVPlayer?
    var playerViewController : AVPlayerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func playButtonClicked (_ sender: UIButton) {
        
        if sender.tag == 100 {
            // Audio
            let url = Bundle.main.url(forResource: "Audio", withExtension: "mp3")
            player = AVPlayer(url: url!)
//            player?.play()

            playerViewController = AVPlayerViewController()
            playerViewController?.player = player
            
            self.present(playerViewController!, animated: true) {
                if let validPlayer = self.playerViewController?.player {
                    validPlayer.play()
                }
            }
        }
        else if sender.tag == 200 {
            // Video
            let url = URL(string: "https://www.rmp-streaming.com/media/bbb-360p.mp4")
            
            player = AVPlayer(url: url!)
            playerViewController = AVPlayerViewController()
            
            playerViewController?.player = player
            self.present(playerViewController!, animated: true) {
                if let validPlayer = self.playerViewController?.player {
                    validPlayer.play()
                }
            }
        }
    }
    
    @IBAction func stopButtonClicked (_ sender : UIButton) {
        
        player?.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

