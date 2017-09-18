//
//  main.swift
//  SwiftTest
//
//  Created by Rashid Kamran on 9/5/17.
//  Copyright © 2017 DIRECTV. All rights reserved.
//

import Foundation

//--> This file is a reference to swift syntax

// ---------------------------------------------------
//--> 1. Variables, Constant, primitive and operations
// ---------------------------------------------------
let const1 = 10  // Implicit type constant
var var1 = 10 // Implicit type variable

let const2 : Double = 20.0 // Explicit declartion constant
var var2: Bool = false // Explicit declaration variable

//const2 = 30.0 // Error - constants can be modified
var2 = true // [OK]

//--> platform specific singned int; 32 or 64 bits. We can use UInt and also variety of bit specific
var anInt : Int
//anInt = Int.max + 1 //--> Compile time error (y)

//--> Floating point
var aFloat: Float = 10.0 //--> Single precision
var aDouble: Double = 10.0 //--> Double Precision
let π = Float.pi // --> Fun stuf


//--> Bool
var aBool: Bool //--> Only true or false

//--> String
// String is like other primitive is a structure.
var aString: String = "Hello World"
var 😸 = "Cat"

//--> Single character is a structure
var aChar: Character = "C"

//--> Multiline string

var aMultilineString = """
    Now you can write the whole damn paragraph
    and it's kind cool. But what's the point?

        It actually retains the indentation, that's the point so you can write the code like

    public class MyClass{
        func thisFun(a:Int) ->Int{
            return 1
        }
    }
"""

print(aMultilineString)

//Single line
/*
     Multi line
 */

/*
 This allows to comment large block of code even when there are multi line comments
/*
     /*
         And comments
     */
 
     This is still comments
 */

var code
 
*/

// ------------------------------
//--> 2. Tupples and typealias
// ------------------------------

typealias Adad = UInt
var myAdad: Adad = Adad.min

//--> Tuple is a group of arbitary values
let aTupple = (100, 10, "News Corp", [1, 2, 3])
//--> accessing via indexes
print(aTupple.0, aTupple.2)

//--> Give items a name - Decompsing
let (price, quantity, compnay, allocation) = aTupple
print(price, allocation)

//--> If a specific element is required
let (knownPrice, _, _, _) = aTupple
print(knownPrice)

//--> typealis a tuple
typealias Asset = (thisPrice: Int, thisQuantity: Int, String, [Int])
let anAsset:Asset = aTupple
print(anAsset.thisPrice)

//--> Comparision in tupple

print((1, "Apple") > (2, "Apple")) // false
print((1, "Apple") > (1, "Apple")) // false
print((1, "Banana") > (1, "Apple")) // true


// ------------------------------
//--> 3. Optionals
// ------------------------------

//var anOptInt: Int = nil // Compiler error
var anOptInt: Int? = nil // [OK]

//--> i. unwrapping using optional binding
if let thisGuy = anOptInt{
    print(thisGuy)
}

//--> ii. Forced unwrapping and use of guard to make sure things are cool
anOptInt = 23

guard (anOptInt != nil) else{
    print ("anOptInt is nil. Existing is the app")
    exit(-1)
}
    
print(anOptInt!) // Fail run time if nill
let anotherInt: Int = anOptInt! // Fail run time if nill
print(anotherInt)
let yetAnotherInt: Int! = anOptInt // Doesn't fail run time if nil
print(yetAnotherInt)
let thisInt: Int = yetAnotherInt // Fails when unwrapping optional value if nil
print(thisInt)

// ------------------------------
//--> 4. Error handling
// ------------------------------

//--> A code block/function that throws/raise an error

enum NumberError: Error{
    case NegativeNumber
    case TooBig
}

func aFunction(_ value: Int) throws {
    if value < 0{
        throw NumberError.NegativeNumber
    }
    
    if value > 10{
        throw NumberError.TooBig
    }
    
    print("The value is \(value)")
}

do{
    try aFunction(1)
    //try aFunction(-2)
    //--> Below this will not execute
    try aFunction(12)
}catch NumberError.TooBig{
    print("Too Big")
}catch NumberError.NegativeNumber{
    print("Negative number")
}

//-->Precondition
let weight = 20 // Change it to negative numbe or zero to fail the precondition
precondition(weight > 0)
print("Weight is \(weight)")

let age = 0 //--> Change it to zero or less to see the failure.
assert(age >= 0, "Can't be less than zero")

// ------------------------------
//--> 6. Operators
// ------------------------------

print(1+2, 2-3, 2*2, 11/5) // Off course - But note that last one is integer divsion
print(11.0/5); /*OR*/ print(11/5.0); /*OR*/ print(11.0/5.0)  //That's more like it

print(11%5) // Remaininder

//--> Nil coalescing
var anOptionalVariable: Int?
print(anOptionalVariable ?? 10) //--> If optional is not nill then unbox or use default that is 10

//--> Range operation
let range1 = 1...10 // 1 to 10
let range2 = 1..<10 // 1 to 9
let range3 = 1... // Unless there's a end this will keep going - Use it with arrays
let rangeTestArray = [1, 2, 3, 4, 5, 6]

for i in rangeTestArray[2...] {
    print(i)
}


//--> Nil-Coalescing operator  -- If optional is nil use the default value or other variable
var anOptionalString: String? = "Value of the string"
print(anOptionalString ?? "No Value Found")


//--> Logical
let bool1 = true
let bool2 = false
let bool3 = true

print( bool1 || bool2) // true
print( bool1 && bool2) // false
print( bool1 && bool3) // true
print( !bool1) // flase
print( !bool2) // true


// ------------------------------
//--> 7. Collection
// ------------------------------

var anArray = [1, 2, 3] //-> Implicitly typed integer array
var anArray2:[String] = ["Helo", "There"] //--> Explicity typed array
var anArray3 = [Int]()//--> An empty array

func testRefernce(anArray:[Int]){
    var thisArray = anArray
    thisArray.append(20)
    print(thisArray)
    print(anArray)
}

print(anArray3)
testRefernce(anArray: anArray3)
print(anArray3)

var aDictionary = ["One": 1, "Two": 2, "Three": 3]

var zeros = Array(repeating: 0, count: 100)
print(zeros)

// ------------------------------
//--> 8. Control flow
// ------------------------------

//-> i. For loops
for i in 1...10{
    print(i)
}

for a in ["one", "tow", "three"]{
    print(a)
}

for (key, value) in ["One": 1, "Two":2]{
    print(key, ":", value)
}


//-> ii. While
var index = 0
while (index < 10){
    index+=1
}

repeat{
    print("Atleast once")
}while(index<10)

var switchInt = 11

//-> iii. Switch
switch(switchInt){
case 1...5:
    print("Between 1 and  5 inclusive")
    
case 6...10:
    print("Between 6 and 10 inclusive")
default:
    print("Greater than 10")
}

//--> Switch on tupple
let point = (10,10)
let box = (width:5, height:5)


switch(point){
case (0,0):
    print("Origin")
case(_,0):
    print("On X axis")
case(0,_):
    print("On Y axis")
default:
    print("Somehwere in the plain")
}

switch(point){
case (-box.width...box.width, -box.height...box.height):
    print("Inside the box")
default:
    print("Outside the box")
}


switch(point){
case (let x, 0), (0, let x):
    print("The point is on axis \(x)")
default:
    print("Not on an axis")
}

var a = 2
switch(a){
case 1:
    print("1")
case 2:
    print("2")
    fallthrough
case 3:
    print("3")
    fallthrough
case 4:
    print("4")
    fallthrough
default:
    print("Something else")
}

//-->iv. Guard -- to exit from block early on invalid condition
a = 5
guard(a < 10) else{
    exit(-1)
}

print("A seems to be OK")

//-->v. API level
if #available(iOS 12, OSX 10.12, *){
    print("Yes")
}
else{
    print("NO")
}

print(funnyString(source: "Rashid"))

let result = returnMultiple()
print(result.hello)
print(result.world)

let numericValue = 1
print(stepFunction(back: true)(numericValue))
print(stepFunction(back: false)(numericValue))

print(addtion(a: 1, b: 2, op: /))

//--> Testing Enum
testEnum3(thisOne: .enum32)

//--> Testing class and struct
propertyTest()
testInheritance()


//--> Optional chaning
var aVar: TestClass?// = TestClass()
aVar?.prop1 = "Hello"
print(aVar?.thisFunction() != nil)

//--> Error
putErrorsTogether()
deferTest()

//--> Type casting
testTypes(box: ScreamingMessageBox(formalMessage: "Aaaaa!!!!"))
print("Hello, World! π = \(π) and 😸 = \(😸)")

