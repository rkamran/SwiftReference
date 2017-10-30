//
//  Enumerations.swift
//  SwiftTest
//
//  Created by Rashid Kamran on 9/11/17.
//

import Foundation

//1. Basic Syntax

enum MyEnum1{
    case enum11
    case enum12
    case enum13
}

//2. Associated Values

enum MyEnum2{
    case enum21(Int, Int)
    case enum22(String)
}

func testFunction(thisValue: MyEnum2)->MyEnum2{
    //a. Use of the values
    switch thisValue {
    
    case .enum21(let a, let b):
        print(a, b)
    case .enum22(let a):
        print(a)
    
    }

    //b. Constructing the enum for returning.
    //return .enum21(10, 10)
    //OR
    return .enum22("Hello There")
}

//3. Raw value

enum MyEnum3: Int {
    case enum31 = 0
    case enum32
    case enum33 = 2
}

func testEnum3(thisOne: MyEnum3){
    print(thisOne.rawValue)
}

//4. Indirect - Recursive enumeration

enum BinaryOp{
    case True
    case False
    indirect case And(BinaryOp, BinaryOp)
    indirect case Or(BinaryOp, BinaryOp)
}

func evalute(op: BinaryOp) -> Bool{
    switch op{
    case .True:
        return true
    case .False:
        return false
    case let .And(op1, op2):
        return evalute(op: op1) || evalute(op: op2)
    case let .Or(op1, op2):
        return evalute(op: op1) && evalute(op: op2)
    }
}

