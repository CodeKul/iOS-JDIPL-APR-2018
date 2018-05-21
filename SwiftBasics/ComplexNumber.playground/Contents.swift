//: Playground - noun: a place where people can play

import UIKit

class Complex {
    
    var real : Int
    var imag : Int
    
    init() {
        real = 0
        imag = 0
    }
    
    init(real: Int, imag: Int) {
        self.real = real
        self.imag = imag
    }
    
    func display() {
        print("(\(real) + \(imag)i)")
    }
    
    func addition(num: Complex) -> Complex {
        
        let res = Complex()
        res.real = self.real + num.real
        res.imag = self.imag + num.imag
        
        return res
    }
    
    func subtraction(num: Complex) -> Complex {
        
        let res = Complex()
        res.real = self.real - num.real
        res.imag = self.imag - num.imag
        
        return res
    }
    
    func multiplication(num: Complex) -> Complex {
        let res = Complex()

        res.real = (self.real * num.real) - (self.imag * num.imag)
        res.imag = (self.real * num.imag) + (self.imag * num.real)
        
        return res
    }
}

let com1 = Complex(real: 10, imag: 20)
com1.display()
let com2 = Complex(real: 5, imag: 10)
com2.display()

var res = com1.addition(num: com2)
res.display()

res = com1.subtraction(num: com2)
res.display()

res = com1.multiplication(num: com2)
res.display()
