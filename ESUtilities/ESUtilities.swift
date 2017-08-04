//
//  ESUtilities.swift
//  ESUtilities
//
//  Created by Eslam on 8/3/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import UIKit


public class ESUtilities {

    /// the shared instance of utilites class
    public static let shared = ESUtilities()
    
    //MARK: - Common properties
    
    /// the screen width of the device
    public var screenWidth:CGFloat {get { return UIScreen.main.bounds.size.width }}
    /// the screen height of the device
    public var screenHeight:CGFloat {get { return UIScreen.main.bounds.size.height }}
    
    
    //MARK: - Common methods
    
    /// make acopy of string and add string to clipboard
    ///
    /// - Parameter str: the string that you want to copy
    public func copyStringToClipboard(str:String) {
        UIPasteboard.general.string = str
    }
    
    /// open the device dialer to call number
    ///
    /// - Parameter number: the number that you want to call it
    /// - Returns: true if the call succeed and false if the call failed
    public func call(number:String) ->Bool  {
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
    public func getCurrentViewController() -> UIViewController? {
        
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
    public func localizedSitringFor(key:String)->String {
        return NSLocalizedString(key, comment: "")
    }
    
}
