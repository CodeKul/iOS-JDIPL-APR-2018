//: Playground - noun: a place where people can play

import UIKit

var intVar1 = 10
var intVar2 = 20

/*
 
 if condition {
 statements
 .
 .
 .
 }
 
 */

if (intVar1 > intVar2 && intVar1 < 20) || intVar2 != 20 {
    print("condition is true")
}
else if intVar2 == 10 {
    print("other condition is true")
}
else {
    print("all the conditions are false")
}

//Loops

//print("Codekul")
//print("Codekul")
//print("Codekul")
//print("Codekul")
//print("Codekul")


/*
 
 initialization
 while condition {
 statements
 incr/decr
 }
 
 */

/*
 a : 0  1   2   3   4   5
 */

var a = 0
while a < 100 {
    
    if a == 0 {
        a += 1
        continue
    }
    if a == 5 {
        break
    }
    if a % 2 == 0 {
        print("\(a) Codekul")
    }
    a += 1
}

/*
 
 initialization
 
 repeate {
 statements
 incr/decr
 } while condition
 
 */

a = 10
repeat {
    a += 1
    print("\(a) Codekul")
} while a < 5


/*
 for item in collection {
 statement
 }
 */

var closedRange = 0...10
var openRange = 100..<200

var arr = ["Red", "Green", "Blue", "Yellow", "Black", "White"]

for (index, b) in openRange.enumerated() {
    print("Value: \(b) - index: \(index)")
}

for (i, color) in arr.enumerated() {
    print("\(color) - \(i)")
    print(arr.index(of: color)!)
}

var numbers = [1.7, 8.3, 8.3, 5.3, 6.2, 8.2]
var sum = 0.0
for number in numbers {
    print(String(format:"%.5f",number))
    sum += number
}

print("Sum of elements of \(numbers) is \(sum)")

/*
 switch option {
 case: opt
 statements
 default:
 statements
 }
 */

print("\n")

a = 12345

var b = 0

while b < 5 {
    
    let digit = a % 10
    
    switch digit {
    case 1:
        print("One")
    case 2:
        print("Two")
    case 3:
        print("Three")
        fallthrough
    case 4:
        print("Four")
        fallthrough
    case 5:
        print("Five")
    case 6:
        print("Six")
    case 7:
        print("Seven")
    case 8:
        print("Eight")
    case 9:
        print("Nine")
    default:
        print("Zero")
    }
    a /= 10
    b += 1
}

var str = "One"

switch str {
case "One":
    print(1)
default:
    print(0)
}

a = 30
switch a {
case 1:
    print("One")
case 2:
    print("Two")
case 3:
    print("Three")
    fallthrough
case 4:
    print("Four")
    fallthrough
case 5:
    print("Five")
case 6:
    print("Six")
case 7:
    print("Seven")
case 8:
    print("Eight")
case 9:
    print("Nine")
case 10...99:
    print("Double digits")
default:
    print("Zero")
}


