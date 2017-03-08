//
//  MyItem.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 3/8/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import Foundation
import CoreData

extension MyItem {
    
    class func insertWithName(name:String, inContext context:NSManagedObjectContext) -> MyItem {
        let newItem:MyItem = NSEntityDescription.insertNewObject(forEntityName: "MyItem", into: context) as! MyItem
        newItem.name = name
        return newItem
    }
    
    class func allItems(context: NSManagedObjectContext) -> [MyItem] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MyItem")
        var result:[MyItem] = []
        do {
            result = try request.execute() as! [MyItem]
        } catch {
            print(error)
        }
        
        return result
    }
}
