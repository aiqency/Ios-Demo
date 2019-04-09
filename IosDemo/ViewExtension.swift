//
//  ViewExtension.swift
//  IosDemo
//
//  Created by huissoudyann on 4/8/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import Foundation
import UIKit

class GenericTapGesture: UITapGestureRecognizer {
    var object: Any?
}

extension UIView {
    
    var positionOnScreen: CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    func getViewSize() -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func addCornerRadiusAnimation(to: CGFloat, duration: CFTimeInterval)
    {
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = to
        animation.duration = duration
        layer.add(animation, forKey: "cornerRadius")
        layer.cornerRadius = to
    }
    
    func round(){
        self.layer.cornerRadius = self.layer.frame.size.height/2
        self.clipsToBounds = true
    }
}
