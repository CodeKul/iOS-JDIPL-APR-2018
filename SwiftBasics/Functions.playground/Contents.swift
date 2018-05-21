//: Playground - noun: a place where people can play

import UIKit

func simpleFunction () {
    print("simpleFunction")
}

simpleFunction()

func functionWithParam (param1: String, param2: Int) {
    print(param1 + " \(param2)")
}
functionWithParam(param1: "CODEKUL", param2: 10)

func functionWithParams (_ param1: String,_ param2: Int) {
    print(param1 + " \(param2)")
}

functionWithParams("JDIPL", 10)

func functionWithReturining () -> String {
    
    return "This is returned from the function"
}

print(functionWithReturining())

/*
     func functionName (_ param1, param2, ...) -> return type {
        scope of function
        statements
        .
        .
        .
     }
 */

func multiplication(Oprand1 a: Int, Oparand2 b: Int, result: inout Int) {
    
    result = a * b
}

var res = 0
multiplication(Oprand1: 10, Oparand2: 20, result: &res)
print(res)

func variadicParams (_ numbers : Int..., name: String) {
    
    print("This is a list: " + "\(numbers)")
    
    var sum = 0
    for number in numbers {
        sum += number
    }
    print(sum)
}
variadicParams(1,2,3,4,5,6,7,8,9,name: "Sumeet")

func returningArray () -> [Int] {
    
    var arr : [Int] = []
    for num in 1..<100 {
        if num % 2 == 0 {
            arr.append(num)
        }
    }
    
    return arr
}

let arrData = returningArray()
print("Even numbers: " + "\(arrData)")

var functionVar : () -> [Int] = returningArray

functionVar()

func addition(_ a: Int,_ b: Int) {
    print("Addition: \(a + b)")
}

func subtraction(_ a: Int,_ b: Int) {
    print("Subtraction: \(a - b)")
}

var mathFuntion : (Int, Int) -> () = addition
mathFuntion(10, 20)
mathFuntion = subtraction
mathFuntion(10, 20)

func doOperation(_ function: (Int, Int) -> ()) {
    function(10, 20)
}

doOperation(mathFuntion)

// Closures

func someFunction (closure: () -> Bool) {
    
    print("someFunction")
    closure()
}

someFunction { () -> Bool in
    print("Closure")
    return true
}

var colors = ["Red", "Green", "Blue", "Yellow", "White", "Black"]

var sortedColors = colors.sorted() { $0 < $1 }

print(sortedColors)












