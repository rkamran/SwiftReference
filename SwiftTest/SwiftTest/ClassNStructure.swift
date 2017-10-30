//
//  ClassNStructure.swift
//  SwiftTest
//
//  Created by Rashid Kamran on 9/12/17.
//

import Foundation

func randomNumber(_ message: String)->Int{
    print("Returning a random number for \(message)")
    return Int(arc4random_uniform(101))
}

class TestClass{
    //--> Stored property
    var prop1 = "prop1"
    
    //--> Readonly computed
    var prop2: String{
        return prop1
    }
    
    //--> Computed read/write
    var prop3: String{
        get{
            return prop1
        }
        set{
            prop1 = newValue
        }
    }
    
    //--> Lazy stored
    lazy var prop4: Int = randomNumber("prop4")
    var prop5: Int = randomNumber("prop5")
    
    func thisFunction(){
        print("I AM INSIDE thisFunction()")
    }
}

func propertyTest(){
    let a = TestClass()
    print(a.prop4)
    print(a.prop4)
}

//--> Inheritance gimmicks

class SuperClass{
    var someProp: Int = 10
    var someOtherProp: Int = 20
    
    static func staticFunc(){
        print("Static function SuperClass")
    }
    
    class func classFunc(){
        print("Class function SuperClass")
    }
    
    subscript(index: String) -> String{
        return "Hello \(index)"
    }
    
    func someFunc(){
        
    }
    
    final func someOtherFun(){
        
    }
}


class SubClass: SuperClass{
    
    override var someProp: Int {
        willSet{
            print("Will Set")
        }
        didSet{
            print("Did set")
        }
    }
    
    override var someOtherProp: Int {
        get{
            return super.someOtherProp
        }
        
        set{
            super.someOtherProp = newValue
        }
    }
    
    override class func classFunc(){
        print("Class function SubClass")
    }
    
    override subscript(index: String) -> String {
        //return super[index]
        return "Hi There \(index)"
    }
    
    override func someFunc() {
    
    }
    
}


func testInheritance(){
    let a: SuperClass = SubClass()
    print(a["Word"])
    
    a.someProp = 30
}


class MessageBox{
    var message: String
    var funny: Bool
    
    required init(message: String, funny: Bool){
        self.message = message
        self.funny = funny
    }
    
    init(formalMessage message: String){
        self.funny = false
        self.message = message
    }
    
    convenience init(funnyMessage message: String){
        self.init(message:message, funny: true)
    }
    
    convenience init(sadMessage message: String){
        self.init(message:message, funny: false)
    }

}

class ScreamingMessageBox: MessageBox {
    var screaming: Bool = true
    
}

func testInit(){
    let a = MessageBox(funnyMessage: "Yahoo!!")
    let b = MessageBox(message: "Hello There", funny: false)
    let c = MessageBox(sadMessage: "Alas!")
    
    print(a.funny, b.funny, c.funny)
}

func testTypes(box: MessageBox){
    if box is ScreamingMessageBox{
        print("Screaming message box")
    }
    else{
        print("Message box")
    }
    
    "Rashid".sing()
}

protocol Singer{
    func sing()
}

extension String: Singer{
    func sing(){
        print(self+" Singing..")
    }
}

