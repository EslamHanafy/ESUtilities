//
//  Optionals.swift
//  ESUtilities
//
//  Created by Eslam on 8/31/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import Foundation


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
