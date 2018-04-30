//: Playground - noun: a place where people can play

import UIKit

//Arrays

var arr1 = Array<Int>()
var arr2 : [Int]
var arr3 = [1,2,3,4,5]

arr1.append(1)

arr2 = []

arr2.append(2)

arr2 = arr3

arr2 += arr1

print(arr2[0])

arr2.count

arr2.capacity

arr1.capacity

arr1.append(2)

arr1.capacity

arr1.append(3)

arr1.capacity

arr2.contains(5)

arr2
var arr4 = arr2.reverse()
arr2


// String

var str = "Codekul"

str.count

str.append(" - The Gurukul for Coders!")

str


// Dictionaries

var dict1 = Dictionary<String,String>()
var dict2 : [Int : String]
var dict3 = ["key" : "value"]

dict1["key1"] = "value1"
dict1["key2"] = "value2"

dict1["key2"]
dict2 = [Int : String]()
dict2[0] = "Zero"
dict2[1] = "One"


dict2[1] = "New one"

dict2[2]

dict2[1]


//Sets

var set1 = Set<String>()
set1.insert("Red")
set1.insert("Green")
set1.insert("Blue")

var set2 = Set<String>()
set2.insert("Yellow")
set2.insert("Green")
set2.insert("White")

set1.intersection(set2)
set1.union(set2)
set1.subtracting(set2)







