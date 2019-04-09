//
//  SinCosView.swift
//  IosDemo
//
//  Created by huissoudyann on 4/7/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import UIKit

class SinCosView: UIView {

    var scale: CGFloat = 0.9
    
    private var circleRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    private var circleCenter: CGPoint {
        return CGPoint(x: bounds.minX, y: bounds.minY)
    }
    
    private var circle: UIView {
        let view = UIView()
        view.layer.cornerRadius = view.frame.width / 2;
        view.layer.masksToBounds = true
        var frame = CGRect();
        frame.size.width = 200;
        frame.size.height = 200;
        view.frame = frame
        return view
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: self.center, radius: circleRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        path.lineWidth = 5.0
        UIColor.blue.set()
        path.stroke()
        
        self.addSubview(circle)
        
        print("Redrawing elements")
    }
}
