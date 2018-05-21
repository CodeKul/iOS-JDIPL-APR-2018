//
//  Player.swift
//  CustomCellDemo
//
//  Created by Varun on 15/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import Foundation

class Player {
    
    var name: String
    var team: String
    var age: Int
    var imageName: String
    
    init(name: String, team: String, age: Int, imageName: String) {
        self.name = name
        self.team = team
        self.age = age
        self.imageName = imageName
    }
    
}
