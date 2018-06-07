//
//  ViewController.swift
//  AccelerometerDemo
//
//  Created by Varun on 06/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager : CMMotionManager?
    @IBOutlet var motionDataLbl : UILabel!
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        motionManager?.accelerometerUpdateInterval = 1
        motionManager?.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            
            self.motionDataLbl.text = "x: \(data!.acceleration.x)\ny: \(data!.acceleration.y)\nz: \(data!.acceleration.z)"
        })
*/
        
        motionManager = CMMotionManager()
        motionManager?.startAccelerometerUpdates()
        motionManager?.startGyroUpdates()
        motionManager?.startMagnetometerUpdates()
        motionManager?.startDeviceMotionUpdates()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        if let accelerometerData = motionManager?.accelerometerData {
            print("Accelerometer Data: ")
            print(accelerometerData)
        }
        if let gyroData = motionManager?.gyroData {
            print("Gyro Data: ")
            print(gyroData)
        }
        if let magnetometerData = motionManager?.magnetometerData {
            print("Magnetometer Data: ")
            print(magnetometerData)
        }
        if let deviceMotion = motionManager?.deviceMotion {
            print("DeviceMotion: ")
            print(deviceMotion)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

