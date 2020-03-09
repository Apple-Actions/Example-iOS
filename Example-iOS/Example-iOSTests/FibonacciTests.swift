//
//  Example_iOSTests.swift
//  Example iOSTests
//
//  Created by Oliver Jones on 28/1/20.
//  Copyright © 2020 Oliver Jones. All rights reserved.
//

import XCTest
@testable import Example_iOS

class FibonacciTests: XCTestCase {

    func testFibonacci() {
        XCTAssertEqual(0, fibonacci(0))
        XCTAssertEqual(1, fibonacci(1))
        XCTAssertEqual(1, fibonacci(2))
        XCTAssertEqual(2, fibonacci(3))
        XCTAssertEqual(3, fibonacci(4))
        XCTAssertEqual(5, fibonacci(5))
        XCTAssertEqual(8, fibonacci(6))
        XCTAssertEqual(13, fibonacci(7))
        XCTAssertEqual(21, fibonacci(8))
        XCTAssertEqual(34, fibonacci(9))
        XCTAssertEqual(55, fibonacci(10))
    }
}
