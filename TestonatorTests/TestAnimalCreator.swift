//
//  TestAnimalCreator.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 3/8/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import UIKit

class TestAnimalCreator {
    
    class func createTestAnimals() -> [Animal] {
        let names = NSArray(contentsOfFile: Bundle.main.path(forResource: "animals", ofType: "plist")!) as! [String]
        
        var animals:[Animal] = []
        for name in names {
            let animal = Animal(name: name)
            animals.append(animal)
        }
        return animals
    }
}
