//: Playground - noun: a place where people can play

import UIKit

class A {
    
    var a : Int
    
    init() {
        a = 0
    }
    
    init(a : Int) {
        self.a = a
    }
    
    func display() {
        print("Value of a: \(a)")
    }
}


class B : A {
    
    var b : Int
    
    override init() {
        b = 0
        super.init()
    }
    
    init(a: Int, b: Int) {
        self.b = b
        super.init(a: a)
    }
    
    override func display() {
        super.display()
        print("Value of b: \(b)")
    }
}

var var1 = A(a: 10)
var1.display()

var var2 = B(a: 20, b: 30)
var2.display()

var var3 = B()
var3.display()

var var4 : A
var4  = B()
var4.display()

//var var5 : B
//var5 = A()



