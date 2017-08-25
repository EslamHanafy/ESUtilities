//
//  ESUtilities.swift
//  ESUtilities
//
//  Created by Eslam on 8/3/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import UIKit


public class ESUtilities:NSObject {
    
    /// the shared instance of utilites class
    public static let utility = ESUtilities()
    
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

//MARK: - Optional safe wrapping
//MARK: Safe String
extension Optional where Wrapped == String {
    var ESSafeValue:String { get { return self ?? "" } }
}
//MARK: Safe Int
extension Optional where Wrapped == Int {
    var ESSafeValue:Int { get { return self ?? 0 } }
}
//MARK: Safe Bool
extension Optional where Wrapped == Bool {
    var ESSafeValue:Bool { get { return self ?? false } }
}
//MARK: Safe Float
extension Optional where Wrapped == Float {
    var ESSafeValue:Float { get { return self ?? 0 } }
}
//MARK: Safe CGFloat
extension Optional where Wrapped == CGFloat {
    var ESSafeValue:CGFloat { get { return self ?? 0 } }
}
//MAR: Safe Double
extension Optional where Wrapped == Double {
    var ESSafeValue:Double { get { return self ?? 0 } }
}
//MAR: Safe Date
extension Optional where Wrapped == Date {
    var ESSafeValue:Date { get { return self ?? Date() } }
}
//MARK: Safe Data
extension Optional where Wrapped == Data {
    var ESSafeValue:Data { get { return self ?? Data() } }
}
//MARK: Safe URL
extension Optional where Wrapped == URL {
    var ESSafeValue:URL { get { return self ?? URL(fileURLWithPath: "") } }
}
//MARK: Safe UIImage
extension Optional where Wrapped == UIImage {
    var ESSafeValue:UIImage { get { return self ?? UIImage() } }
}
//MARK: Safe UIImageView
extension Optional where Wrapped == UIImageView {
    var ESSafeValue:UIImageView { get { return self ?? UIImageView() } }
}
//MARK: Safe UIView
extension Optional where Wrapped == UIView {
    var ESSafeValue:UIView { get { return self ?? UIView() } }
}
//MARK: Safe [Any]
extension Optional where Wrapped == [Any] {
    var ESSafeValue:[Any] { get { return self ?? [] } }
}
//MARK: Safe [String:Any]
extension Optional where Wrapped == [String:Any] {
    var ESSafeValue:[String:Any] { get { return self ?? [:] } }
}
//MARK: Safe [String]
extension Optional where Wrapped == [String] {
    var ESSafeValue:[String] { get { return self ?? [] } }
}
