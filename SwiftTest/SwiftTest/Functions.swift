//
//  Functions.swift
//  SwiftTest
//
//  Created by Rashid Kamran on 9/5/17.
//  Copyright © 2017 DIRECTV. All rights reserved.
//

import Foundation

//--> ALL ABOUT FUNCTION

//--> 1. Function with a parameter and a return value
//--> We can use _ as first paramter to not required the name.
func funnyString(source: String)->String {
    return "Funny "+source
}

//--> Function returning multiple values. Really is a tuple

func returnMultiple() -> (hello:String, world: String){
    return ("Hello", "World")
}


//-> Variable property returning a function
var aVarFun: (String)->String {
    return funnyString
}

//--> Nested function
func stepFunction(back: Bool) -> (Int)->Int{

    func backward(number: Int)->Int{
        return number-1
    }

    func forward(number: Int)->Int{
        return number+1
    }

    return back ? backward : forward
}


//--> ALL ABOUT CLOSURE

//--> Ful form
var closure1 =
{
    (i1: Int, i2: Int)->Int in
    return i1+i2
}

//--> Inferred paramter type and return type from the declration
var closure2: (Int, Int)->Int =
{
    i1, i2 in
    return i1+i2
}

//--> Ommitting the name completly
var closure3: (Int, Int)->Int =
{
    //return $0 + $1 //OR
    $0+$1
}


//--> Funny stuff
typealias MyAddition = (Int, Int)->Int

func addtion(a: Int, b: Int, op:MyAddition)->Int{
    return op(a,b)
}


//--> Escaping -- When closure is called after function returns

func checkThisOut(closure: @escaping MyAddition) ->MyAddition{
    return closure
}
