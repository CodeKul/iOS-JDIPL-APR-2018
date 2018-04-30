//: Playground - noun: a place where people can play

import UIKit


var a = 10
var b = 20
var c = 0

/*
 
 +
 -
 *
 /
 %
 
 */

c = a + b
c = a - b
c = a * b
c = a / b
c = a % b

/*
 
 +=
 -=
 *=
 /=
 %=
 
 */

c += a      // c = c + a
c -= a
c *= a
c /= a
c %= a

/*
 
 ==
 !=
 <
 >
 <=
 >=
 
 */

var res : Bool

res = a == b
res = a != b
res = a < b
res = a > b
res = a <= b
res = a >= b

/*
 
 &&
 ||
 !
 
    p   q   &&  ||  !p
    1   1   1   1   0
    1   0   0   1   0
    0   1   0   1   1
    0   0   0   0   1
 
 */

res = a < b || a < 20
res = !(a < b)

a > b ? print("true") : print("false")

