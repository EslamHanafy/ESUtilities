//
//  Views.swift
//  ESUtilities
//
//  Created by Eslam on 9/8/17.
//  Copyright © 2017 eslam. All rights reserved.
//

import UIKit

extension UIView {
    
    /// change the view layer to be a circle
    @IBInspectable var ESCircle:Bool{
        get {
            if self.ESCircle == nil {
                return false
            }
            return self.ESCircle
        }
        set {
            if newValue {
                self.superview?.layoutIfNeeded()
                self.layer.cornerRadius = self.frame.size.height / 2
            }
        }
    }
    
    /// change the view layer to be a circle
    @IBInspectable var ESShadow:Bool{
        get {
            if self.ESShadow == nil {
                return false
            }
            return self.ESShadow
        }
        set {
            if newValue {
                if self is UIImageView {
                    makeShadow(forLayer: makeLayer())
                }else{
                    makeShadow(forLayer: self.layer)
                }
            }
        }
    }
    
    
    /// create new layer and add it to super view
    ///
    /// - Returns: the created layer
    fileprivate func makeLayer()-> CALayer {
        let layer = CALayer()
        layer.bounds = self.bounds.insetBy(dx: 20, dy: 20)
        layer.position = self.center
        layer.backgroundColor = self.layer.backgroundColor
        layer.zPosition = -5
        self.superview!.layer.addSublayer(layer)
        return layer
    }
    
    
    /// make shadow for layer
    ///
    /// - Parameter lyr: the layer that you want to add the shadow for it
    fileprivate func makeShadow(forLayer lyr:CALayer) {
        self.superview?.layoutIfNeeded()
        lyr.shadowColor = UIColor.black.cgColor
        lyr.shadowOffset = CGSize.zero
        lyr.shadowOpacity = 0.5
        lyr.masksToBounds = false
        lyr.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        lyr.shadowRadius = 3
    }
    
}
