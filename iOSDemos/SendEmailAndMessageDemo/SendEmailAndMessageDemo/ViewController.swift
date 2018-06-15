//
//  ViewController.swift
//  SendEmailAndMessageDemo
//
//  Created by Varun on 13/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    var composeVC : MFMailComposeViewController?
    var messageVC : MFMessageComposeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func mailButtonClicked(_ sender : UIButton) {
        composeVC = MFMailComposeViewController()
        composeVC?.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC?.setToRecipients(["varun@codekul.com"])
        composeVC?.setSubject("This is subject")
        composeVC?.setMessageBody("This is message body", isHTML: false)

        // Present the view controller modally.
        self.present(composeVC!, animated: true, completion: nil)
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        composeVC?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func messageButtonClicked(_ sender : UIButton) {
       
        if(MFMessageComposeViewController.canSendText())
        {
            messageVC = MFMessageComposeViewController()
            messageVC?.recipients = ["7588364088","1234567890"]
            messageVC?.body = "hello !! this is a test SMS"
            messageVC?.messageComposeDelegate = self
            
            self.present(messageVC!, animated: true, completion: nil)
        }
    }

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result.rawValue {
        case MessageComposeResult.cancelled.rawValue:
            print("cancelled")
            
        case MessageComposeResult.failed.rawValue:
            print("failed")
            
        case MessageComposeResult.sent.rawValue:
            print("sent")
            
        default:
            print("default")
        }
        controller.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

