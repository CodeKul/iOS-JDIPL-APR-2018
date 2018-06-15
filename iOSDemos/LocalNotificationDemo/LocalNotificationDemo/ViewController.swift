//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Varun on 07/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    var center : UNUserNotificationCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
            if granted {
                print("Authorised")
            }
            else {
                print("Unauthorised")
            }
        }
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()

    }

    @IBAction func createLocalNotification(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "This is Title"
        content.body = "This is body"
        content.sound = UNNotificationSound.default()
        
        var dateInfo = DateComponents()
        dateInfo.hour = 16
        dateInfo.minute = 2
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
        
        center = UNUserNotificationCenter.current()
        center?.delegate = self
        center?.add(request, withCompletionHandler: { (error) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        })
        
        print("Notification created")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let alert = UIAlertController(title: notification.request.content.title, message: notification.request.content.body, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (ok) in
            
        }))
        self.present(alert, animated: true, completion: nil)
        completionHandler(.sound)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

