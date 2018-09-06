//
//  CowsAndBullsTests.swift
//  CowsAndBullsTests
//
//  Created by Bharg Sharma on 17/7/18.
//  Copyright © 2018 Bharg Sharma. All rights reserved.
//

import XCTest
@testable import CowsAndBulls

class CowsAndBullsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNoCowsOrBulls() {
      XCTAssertEqual(check(parsedInput: [9, 3, 4, 5], secretNum: [8, 2, 0, 7]), Response.init(bulls: 0, cows: 0))
    }
  
  func testAllBullsMatch() {
    XCTAssertEqual(check(parsedInput: [1, 2, 3, 4], secretNum: [1, 2, 3, 4]), Response.init(bulls: 4, cows: 0))
  }
  
  func testSomeBullsMatch() {
    XCTAssertEqual(check(parsedInput: [1, 2, 3, 4], secretNum: [1, 0, 3, 0]), Response.init(bulls: 2, cows: 0))
  }
  
  func testAllCowsMatch() {
    XCTAssertEqual(check(parsedInput: [4, 3, 2, 1], secretNum: [1, 2, 3, 4]), Response.init(bulls: 0, cows: 4))
  }
  
  func testSomeCowsMatch() {
    XCTAssertEqual(check(parsedInput: [0, 1, 4, 5], secretNum: [1, 2, 3, 4]), Response.init(bulls: 0, cows: 2))
  }
  
  func testInputIntConversion() {
    XCTAssertEqual(checkConvertToInt("4"), 4)
  }
  
  func testInputIntConversionFail() {
    XCTAssertEqual(checkConvertToInt("!"), nil)
  }
  
  func testCorrectNumberOfValidDigitsParsing() {
    XCTAssertEqual(Game(secretLength: 5).parsing("34678"), [3, 4, 6, 7, 8])
  }
  
  func testInvalidParsing() {
    XCTAssertEqual(Game(secretLength: 56).parsing("!@&*"), nil)
  }
  
  func testTwoDigitInvalidParsing() {
    XCTAssertEqual(Game(secretLength: 3).parsing("34"), nil)
  }
  
  func testFourDigitInvalidParsing() {
    XCTAssertEqual(Game(secretLength: 4).parsing("1234!"), nil)
  }
  
  func testTooManyDigitsParsing() {
    XCTAssertEqual(Game(secretLength: 9).parsing("1234567890"), nil)
  }
  
  func testSecretNumberSize() {
    for secretLength in 1...10 {
      for _ in 1...100 {
        XCTAssertEqual(Game(secretLength: secretLength).secretNumber.count, secretLength)
      }
    }
  }
  
  func testSecretNumberType() {
    for _ in 1...100 {
      XCTAssertFalse(Game(secretLength: 7).secretNumber.contains(where: ({ (digit) -> Bool in
        return !(0...9).contains(digit)
      })))
    }
  }
  
}
