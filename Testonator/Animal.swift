//
//  Animal.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 3/8/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import UIKit

class Animal {
    var name:String
    var image:UIImage?
    
    init(name:String) {
        self.name  = name
        self.image = UIImage(named: name)
    }
}
