//
//  ESNumbers.swift
//  ESUtilities
//
//  Created by Eslam on 9/2/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import UIKit

public class ESNumbers: NSObject {

    
    /// convert string to NSNumber
    ///
    /// - Parameter string: the string number
    /// - Returns: NSNumber if the string contains numbers, else it will return nill.
    public class func getNSNumber(fromString string : String) -> NSNumber? {
        return NumberFormatter().number(from: string)
    }
    
    /// convert string to Int
    ///
    /// - Parameter string: the string number
    /// - Returns: Int if the string contains numbers, else it will return nil.
    public class func getInt(fromString string : String) -> Int? {
        if let n = getNSNumber(fromString: getStringInt(fromString: string)) { return n.intValue } else { return nil }
    }
    
    /// convert string to UInt
    ///
    /// - Parameter string: the string number
    /// - Returns: UInt if the string contains numbers, else it will return nil.
    public class func getUInt(fromString string : String) -> UInt? {
        if let n = getNSNumber(fromString: getStringInt(fromString: string)) { return n.intValue >= 0 ? n.uintValue : nil } else { return nil }
    }
    
    /// convert string to Double
    ///
    /// - Parameter string: the string number
    /// - Returns: Double if the string contains numbers, else it will return nil.
    public class func getDouble(fromString string : String) -> Double? {
        if let n = getNSNumber(fromString: getStringInt(fromString: string)) { return n.doubleValue } else { return nil }
    }
    
    /// convert string to NSDecimalNumber
    ///
    /// - Parameter string: the string number.
    /// - Returns: NSDecimalNumber if the string contains numbers, else it will return nil.
    public class func getDecimalNumber(fromString string : String) -> NSDecimalNumber? {
        if let n = getNSNumber(fromString: getStringInt(fromString: string)) { return NSDecimalNumber(decimal: n.decimalValue) } else { return nil }
    }

    /// convert string to Decimal
    ///
    /// - Parameter string: the string number.
    /// - Returns: Decimal if the string contains numbers, else it will return nil.
    public class func getDecimal(fromString string : String) -> Decimal? {
        if let n = getNSNumber(fromString: getStringInt(fromString: string)) { return n.decimalValue } else { return nil }
    }
    
    /// get only numbers from string that may contains numbers.
    ///
    /// - Parameter string: the string that may contains numbers.
    /// - Returns: the numberes only if exist as string.
    public class func getStringInt(fromString string:String)->String {
        return string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
    }
    
    /// convert number to array of digits
    ///
    /// - Parameter number: the Int number
    /// - Returns: array of the number digits
    public class func getDigitsOf(number:Int)->[Int]{
        var number = number
        var digits : [Int] = []
        while number > 0 {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        return digits
    }
    
    /// generate random number with min 2 digits and max 18 digits.
    ///
    /// - Parameter count: digits count of the generated number, if you give it more than 18 digits or less than 2 digits it will return 0, it should be even number and if you pass it as odd number it will round down to even number for example if you pass it as 17 it will return number with 16 digits.
    /// - Returns: generated number.
    public class func generateRandomNumber(ofDigits count:Int = 18)->UInt64{
        if count < 2 || count > 18 {
            return 0
        }
        let sz :UInt32 = UInt32(pow10(withNumber: count / 2))
        let ms :UInt64   = UInt64(arc4random_uniform(sz))
        let ls :UInt64   = UInt64(arc4random_uniform(sz))
        let digits18 :UInt64 = ms * UInt64(sz) + ls
        
        return digits18
    }
    
    /// get 10 pow number for example 10 pow 8 will return 100000000.
    ///
    /// - Parameter number: the pow number
    /// - Returns: 10 pow the givan number
    public class func pow10(withNumber number:Int) -> Int {
        return Int(pow(10.0, Double(number)))
    }
}
