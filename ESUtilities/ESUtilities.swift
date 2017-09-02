//
//  ESUtilities.swift
//  ESUtilities
//
//  Created by Eslam on 8/3/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import UIKit


public class ESUtilities:NSObject {
    
    //MARK: - Common properties
    
    /// the screen width of the device
    public class var screenWidth:CGFloat {get { return UIScreen.main.bounds.size.width }}
    /// the screen height of the device
    public class var screenHeight:CGFloat {get { return UIScreen.main.bounds.size.height }}
    
    
    //MARK: - Common methods
    
    /// make acopy of string and add string to clipboard
    ///
    /// - Parameter str: the string that you want to copy
    public class func copyStringToClipboard(str:String) {
        UIPasteboard.general.string = str
    }
    
    /// open the device dialer to call number
    ///
    /// - Parameter number: the number that you want to call it
    /// - Returns: true if the call succeed and false if the call failed
    public class func call(number:String) ->Bool  {
        let url = URL(string:"tel://\(number)")
        //check if the url is valid
        if let url = url{
            //check the ios version
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
                return true
            }
            //return false because the device does not have a dialer app
            return false
        }
        //return false because the url was not valid
        return false
    }
    
    /// get current active view controller if exist
    ///
    /// - Returns: the current active view controller if exist
    public class func getCurrentViewController() -> UIViewController? {
        
        // we must get the root UIViewController and iterate through presented views
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            
            var currentController: UIViewController! = rootController
            
            // Each ViewController keeps track of the view it has presented, so we
            // can move from the head to the tail, which will always be the current view
            while( currentController.presentedViewController != nil ) {
                
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        
        return nil
    }
    
    /// get the localized sitring for a specific key
    ///
    /// - Parameter key: the key for the string
    /// - Returns: the specific localized sitring for the given key
    public class func localizedSitringFor(key:String)->String {
        return NSLocalizedString(key, comment: "")
    }
    
    
    
    //MARK: - Colors
    /// get color from hex string
    ///
    /// - Parameters:
    ///   - hex: six hex characters for the color.
    ///   - alpha: alpha value for the color , default is 1.0.
    /// - Returns: the color that is referring to the given hex code, but if you gave a wrong code, it will return black color.
    public class func colorFrom (hexString hex:String,withAlpha alpha:CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.black
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    
    
}
