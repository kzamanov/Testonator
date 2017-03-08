//
//  PlistParser.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 3/8/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import Foundation

class PlistParser {
    
    class func parseTestPlist() -> [String] {
        let path = Bundle.main.path(forResource: "names", ofType: "plist")
        
        if let _ = path {
            let array = NSArray(contentsOfFile: path!) as! [String]
            
            for _ in 0..<array.count {
                sleep(1)
            }
            return array
        }

        return []
    }
}
