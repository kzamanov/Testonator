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
    
    func testMeasurePerformance() {
        self.measure {
            PlistParser.parseTestPlist()
        }
    }
    
    func testObjectCreation() {
        let animals:[Animal] = TestAnimalCreator.createTestAnimals()
        
        // Test images
        for a in animals {
            XCTAssertNotNil(a.image, "Image should not be nil")
        }
        
    }
    
    func testAsynchronousBlock() {
        var success = false
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(2)
            success = true
        }
        XCTAssert(success)
        
       /* let expectation = self.expectation(description: "Block expectation")
        var success = false
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(2)
            expectation.fulfill()
            success = true
        }
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssert(success)
        }*/
    }
    
    func testAsynchronousURLConnection() {
        let url = URL(string: "https://www.google.bg")!
        let expectation = self.expectation(description: "GET \(url)")
        
        let session = URLSession.shared
        let task:URLSessionDataTask = session.dataTask(with: url) { data, response, error in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as? HTTPURLResponse,
                let _ = HTTPResponse.url,
                let MIMEType = HTTPResponse.mimeType
            {
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                XCTAssertEqual(MIMEType, "text/html", "HTTP response content type should be text/html")
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            expectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
}
