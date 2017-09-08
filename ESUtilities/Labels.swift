//
//  Labels.swift
//  ESUtilities
//
//  Created by Eslam on 9/8/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import UIKit


extension UILabel {

    /// determine if the label match the text size or it truncated
    var ESIsTruncated:Bool {
        get {
            let size: CGSize = (self.text.ESSafeValue as NSString).boundingRect(
                with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude),
                options: NSStringDrawingOptions.usesLineFragmentOrigin,
                attributes: [NSFontAttributeName: self.font],
                context: nil).size
            
            return (size.height > self.bounds.size.height)
        }
    }
    
}
