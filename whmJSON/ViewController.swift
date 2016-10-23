//  ViewController.swift
//
//  Created by Tyler Burnam on 10/23/16.
//  Copyright © 2016 Tyler Burnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Construct object
        let myClass = testClass()
        myClass.word = "Hello!"
        myClass.num = 42
        myClass.bool = true
        
        // Formatted output
        formattedObjectOutput(objects: [myClass], message: "Object before deserialization")
        
        // Serialize
        let data = whmJSON.Serialize(object: myClass)
        
        // Output
        print("JSON:", NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
        
        // Deserialize
        let deserializedObjects: [testClass] = whmJSON.Deserialize(data: data)
        
        // Formatted output
        formattedObjectOutput(objects: deserializedObjects, message: "Object after deserialization")
    }
    
    
    func formattedObjectOutput(objects: [testClass], message: String) {
        print()
        print()
        print("------------------------------------------")
        print(message)
        print("------------------------------------------")
        for var object in objects {
            print("word:", object.word)
            print("num:" , object.num)
            print("bool:" , object.bool)
            
        }
        print()
        print()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

