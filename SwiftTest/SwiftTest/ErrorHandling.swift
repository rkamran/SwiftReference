//
//  ErrorHandling.swift
//  SwiftTest
//
//  Created by Rashid Kamran on 9/15/17.
//  Copyright © 2017 DIRECTV. All rights reserved.
//

import Foundation

enum MyError: Error{
    case EmptyError
    case ErrorWithCode(Int)
    case ErrorWithCodeAndMessage(Int, String)
}


func errorTest1(shouldThrow: Bool) throws{
    if shouldThrow{
        throw MyError.EmptyError
    }
    
    print("No error from error test1")
}

func errorTest2(shouldThrow: Bool) throws{
    if shouldThrow{
        throw MyError.ErrorWithCode(200)
    }

    print("No error from error test 2")
}

func errorTest3(shouldThrow: Bool) throws{
    
    if shouldThrow{
        throw MyError.ErrorWithCodeAndMessage(200, "Skye has fallen!!!")
    }
    
    print("No error from error test 3")
}


func putErrorsTogether() {
    if let a = try? errorTest1(shouldThrow: false){
        print("Got A \(a)")
    }

    do{
        try errorTest2(shouldThrow: false)
        try errorTest3(shouldThrow: true)
    }
    catch MyError.EmptyError{
        print("Handling empty error")
    }
    catch MyError.ErrorWithCode(let code){
        print("Error with code ",code)
    }
    catch MyError.ErrorWithCodeAndMessage(let code, let message){
        print("Error with code and message ", code, message)
    }catch{
        print(error)
    }
    
}


func deferTest(){
    defer{
        print("Running defer")
    }
    
    print("Running other stufff rist")    
}
