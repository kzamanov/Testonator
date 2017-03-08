//
//  TestonatorTests.swift
//  TestonatorTests
//
//  Created by Kostadin Zamanov on 2/26/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import XCTest
@testable import Testonator

class TestonatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceOfJsonRead() {
        // This is an example of a performance test case.
        self.measure {
            PlistParser.parseTestPlist()
        }
    }
    
    func testAnimalNames() {
        let names = NSArray(contentsOfFile: Bundle.main.path(forResource: "animals", ofType: "plist")!) as! [String]
        
        for name in names {
            let image = UIImage(named: name)
            print(name)
            XCTAssertNotNil(image)
        }
    }
}
