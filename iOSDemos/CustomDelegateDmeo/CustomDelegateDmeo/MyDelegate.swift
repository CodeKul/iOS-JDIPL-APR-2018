//
//  MyDelegate.swift
//  CustomDelegateDmeo
//
//  Created by Varun on 13/06/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import Foundation

@objc protocol MyDelegate : NSObjectProtocol {
    
    func textFieldResingedWithText(_ text: String)
    @objc optional func textFieldResingedWithoutText()
}
