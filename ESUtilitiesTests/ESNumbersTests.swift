//
//  ESNumbersTests.swift
//  ESUtilities
//
//  Created by Eslam on 9/2/17.
//  Copyright © 2017 magdsoft. All rights reserved.
//

import XCTest
@testable import ESUtilities

class ESNumbersTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            print(ESNumbers.getDigitsOf(number: ESNumbers.getInt(fromString: "e1s2l3a4m").ESSafeValue))
        }
    }
    
    func testNumbers() {
        let string = "123456789"
        XCTAssertEqual(ESNumbers.getInt(fromString: string), 123456789)
    }
    
    func testArabicNumbers() {
        let string = "١٢٣٤٥٦٧٨٩"
        let val:String = "١٢٣٤٥٦٧٨٩"
        XCTAssertFalse("\(ESNumbers.getInt(fromString: string).ESSafeValue)" == val)
    }
    
    func testNumberWithString() {
        let string = "eslam 123 456 7test89"
        let intVal:Int = 123456789
        XCTAssertEqual(ESNumbers.getInt(fromString: string), intVal)
    }

    func testArrayOfDigits() {
        let number:Int = 01273841480
        let array:[Int] = [1,2,7,3,8,4,1,4,8,0]
        XCTAssertEqual(ESNumbers.getDigitsOf(number: number), array)
    }
    
    func testRandomNumbers() {
        XCTAssertEqual(ESNumbers.getDigitsOf(number: Int(ESNumbers.generateRandomNumber(ofDigits: 2))).count, 2)
    }
    
    func testNumberWithDigits() {
        let count = 10
        let value = 10000000000
        XCTAssertEqual(ESNumbers.pow10(withNumber: count), value)
    }
}
