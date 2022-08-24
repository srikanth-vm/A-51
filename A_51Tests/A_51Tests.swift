////  A_51Tests.swift
//  A_51Tests
//
//  Created by Madhusudhan, Srikanth on 03/08/22.
//  
//

import XCTest
@testable import A_51

class A_51Tests: XCTestCase {

    func testAddition() {
        // Given.
        let lhs = 5
        let rhs = 7
        
        // When.
        let result = BasicCalculator.add(lhs: lhs, rhs: rhs)
        
        // Then.
        XCTAssertEqual(result, 12)
    }
    
    func testSubtraction() {
        // Given.
        let lhs = 7
        let rhs = 7
        
        // When.
        let result = BasicCalculator.subtract(lhs: lhs, rhs: rhs)
        
        // Then.
        XCTAssertEqual(result, 0)
    }
    
    func testMultiplication() {
        // Given.
        let lhs = 5
        let rhs = 7
        
        // When.
        let result = BasicCalculator.multiply(lhs: lhs, rhs: rhs)
        
        // Then.
        XCTAssertEqual(result, 35)
    }
    
    func testDivision() {
        // Given.
        let lhs = 35
        let rhs = 7
        
        // When.
        let result = BasicCalculator.divide(lhs: lhs, rhs: rhs)
        
        // Then.
        XCTAssertEqual(result, 5)
    }

}
