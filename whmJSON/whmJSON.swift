//  whmJSON.swift
//
//  Created by Tyler Burnam on 10/21/16.
//  Copyright © 2016 Tyler Burnam. All rights reserved.

import Foundation

class whmJSON {
    
    static func Serialize(object: Any) -> Data {
        
        // Reflect object and create dictionary to store object fields in
        let mirror = Mirror(reflecting: object)
        var objectDictionary = [String:String]()
        
        // Iterate over object attributes and put key/values into the dict
        // TODO: This needs to serialize objects, not just primitive types
        for (_, attribute) in mirror.children.enumerated() {
            if let propertyName = attribute.label as String! {
                let value = "\(attribute.value)"
                objectDictionary[propertyName] = value
            }
        }
        
        // Serialize dictionary
        do {
            let json = try JSONSerialization.data(withJSONObject: objectDictionary, options: [])
            return json
            
        }
            
        // Error Handling
        catch let error as NSError {
            print(error)
            return Data()
        }
    }
    
    static func Deserialize<T>(data: Data) -> [T] where T: NSObject {
        
        // Collection of deserialized objects to return
        var objects = [T]()
        
        do {
            // Parse data as an array (check for an array of JSONs)
            let parsedData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSArray
            
            // If it is an array of JSON strings, iterate
            if (parsedData != nil) {
                for i in 0...(parsedData?.count)! - 1 {
                    if let record = parsedData?[i] as? [String:String] {
                        objects.append(whmBuildObject(record: record))
                    }
                }
            }
            // Else, read the single JSON record and build
            else {
                let singleObjectValue = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:String]
                let record = singleObjectValue! as [String:String]
                objects.append(whmBuildObject(record: record))
            }
        }
        catch let error as NSError {
                print(error)
        }
        
        return objects
    }
    
    
    static func whmBuildObject<T>(record: [String:String]) -> T where T: NSObject {
        
        let newObject = T()
        
        let mirror = Mirror(reflecting: newObject)
        
        for (_, attribute) in mirror.children.enumerated() {
            if let propertyName = attribute.label as String! {
                let propType = getPropertyTypeOfObject(object: newObject, propertyName: propertyName)
                
                switch (propType) {
                    case "Double"?:
                        (newObject as AnyObject).setValue((record[propertyName]! as NSString).doubleValue, forKey: propertyName)
                        break
                    case "Int"?:
                        (newObject as AnyObject).setValue((record[propertyName]! as NSString).integerValue, forKey: propertyName)
                    case "Bool"?:
                        (newObject as AnyObject).setValue((record[propertyName]! as NSString).boolValue, forKey: propertyName)
                    case "String"?:
                        (newObject as AnyObject).setValue((record[propertyName]! as NSString), forKey: propertyName)
                    
                    // TODO: This needs ot catch generic objects and build the object accordingly
                    default:
                        (newObject as AnyObject).setValue(record[propertyName]! as NSString, forKey: propertyName)
                        break
                    }
            }
        }
        return newObject
    }
    
    static func getPropertyTypeOfObject(object: Any, propertyName: String) -> String? {
        
        let type: Mirror = Mirror(reflecting: object)
        
        for child in type.children {
            if child.label! == propertyName {
                return String(describing: type(of: child.value))
            }
        }
        return nil
    }
    
}
