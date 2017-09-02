//
//  ESStrings.swift
//  ESUtilities
//
//  Created by Eslam on 9/2/17.
//  Copyright © 2017 magdsoft. All rights reserved.
//

import UIKit

class ESStrings: NSObject {

    /// generate random key
    ///
    /// - Returns: the generated key
    class func generateRandomKey()->String {
        let random = ESNumbers.generateRandomNumber()
        let time = Date().timeIntervalSince1970
        let udid = (UIDevice.current.identifierForVendor?.uuidString).ESSafeValue
        let str = udid + "\(time)" + "\(random)"
        let data = str.data(using: String.Encoding.utf8)
        return (data?.base64EncodedString(options: [])).ESSafeValue
    }
    
}
