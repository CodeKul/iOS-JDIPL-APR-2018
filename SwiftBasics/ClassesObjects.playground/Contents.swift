//: Playground - noun: a place where people can play

import UIKit

/*
 
 class ClassName {
    member vars
    member functions
 }
 
 */

class A {

    private var myVar1 : Int
    
    init() {
        myVar1 = 0
    }
    
    init(myVar1 : Int) {
        self.myVar1 = myVar1
    }
    
    init(obj : A) {
        self.myVar1 = obj.myVar1
    }
    
    func display() {
        print("Value: \(myVar1)")
    }
    
    func setMyVar1(myVar1 : Int) {
        self.myVar1 = myVar1
    }
}

var a1 = A()
a1.display()

var a2 = A(myVar1: 10)
a2.display()

var a3 = A(obj: a2)
a3.display()

a3.setMyVar1(myVar1: 20)
a3.display()


class Car {
    
    var color : String = ""
    var transmissionType : String
    var gear : Int
    
    init() {
        color = "White"
        transmissionType = "Auto"
        gear = 0
    }
    
    init(color: String, transmissionType: String, gear: Int) {
        self.color = color
        self.transmissionType = transmissionType
        self.gear = gear
    }
    
    init(car : Car) {
        self.color = car.color
        self.transmissionType = car.transmissionType
        self.gear = car.gear
    }
    
    func accelerate() {
        print("Accelerating...")
    }
    
    func shifGear(incr: Bool) {
        if incr {
            gear += 1
        }
        else {
            gear -= 1
        }
        print("Gear shifted to \(gear)")
    }
    
    func goForward() {
        print("Going forward...")
    }
    
    func goBackward() {
        print("Going backward...")
    }
    
    func turn(right: Bool) {
        if right {
            print("Turning right...")
        }
        else {
            print("Turining left...")
        }
    }
    
    func displayCarProperties() {
        print("Color: \(color)\nTransmissionType: \(transmissionType)\nCurrent gear: \(gear)")
    }
}

var car1 = Car()
car1.displayCarProperties()

var car2 = Car(color: "Red", transmissionType: "Manual", gear: 0)
car2.displayCarProperties()
car2.accelerate()
car2.shifGear(incr: true)
car2.goForward()
car2.goBackward()
car2.turn(right: true)
car2.turn(right: false)

