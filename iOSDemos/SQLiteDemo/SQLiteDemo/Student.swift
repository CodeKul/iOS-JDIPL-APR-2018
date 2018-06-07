//
//  Student.swift
//  SQLiteDemo
//
//  Created by Varun on 31/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import Foundation

class Student {
    
    var rno : Int
    var name : String
    var marks : Int
    
    init(rno: Int, name: String, marks: Int) {
        self.rno = rno
        self.name = name
        self.marks = marks
    }
}
