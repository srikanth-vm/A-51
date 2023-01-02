////  BasicCalculator.swift
//  A_51
//
//  Created by Madhusudhan, Srikanth on 03/08/22.
//  
//

import Foundation

struct BasicCalculator {
    
    // MARK: - Operations
    
    static func add(lhs: Int, rhs: Int) -> Int {
        lhs + rhs
    }
    
    static func subtract(lhs: Int, rhs: Int) -> Int {
        lhs - rhs
    }
    
    static func divide(lhs: Int, rhs: Int) -> Double? {
        guard rhs != 0 else { return nil }
        
        return Double(lhs) / Double(rhs)
    }
    
    static func multiply(lhs: Int, rhs: Int) -> Int {
        lhs * rhs
    }
    
}
