//: Playground - noun: a place where people can play

import UIKit

var str : String?

str = "The Gurukul for Coders!"

var str1 = "Codekul " + str!

print(str1)

print(str!)

// Any
// AnyObject
// AnyClass

var anyVar : Any

anyVar = "Codekul"
anyVar = 10.0
//anyVar = 30.20

print(anyVar)

var doubleVar = 10.0

var optionalVar = (anyVar as? Double)

print(optionalVar)

var res = doubleVar + optionalVar!

print(res)

var strDigit = "1"

var digit = Int(strDigit)

print(digit)

// Tuples

var tuple1 = (1,2,3,"Four", "Five", 6.0, 7.0)

tuple1.0
tuple1.1
tuple1.2
tuple1.3
tuple1.4
tuple1.5
tuple1.6

assert(tuple1.1 < 5, "This is from assertion")



