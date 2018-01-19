//
//  MaView.swift
//  quartz2d-swift
//
//  Created by Hassan Ahmed on 19/01/2018.
//  Copyright © 2018 Hassan Ahmed. All rights reserved.
//

import Cocoa

class MaView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        let context = NSGraphicsContext.current?.cgContext
            doClippedCircle(context: context)
    }
    
    func doSimpleRect(context: CGContext?) {
        // Setup the rectangle for drawing
        let ourRect = CGRect(x: 20.0, y: 20.0, width: 130.0, height: 100.0)
        context?.fill(ourRect)
    }
    
    /*
     - (void)doStrokedRect:(CGContextRef) context {
     CGRect ourRect;
     
     CGContextSetRGBStrokeColor(context, 0.482, 0.62, 0.871, 1.0);
     // Setup the rectangle for the drawing
     ourRect.origin.x = ourRect.origin.y = 20.0;
     ourRect.size.width = 130.0;
     ourRect.size.height = 100.0;
     
     CGContextStrokeRectWithWidth(context, ourRect, 3.0);
     }
     */
    
    func doStroke(context: CGContext?) {
        let ourRect = CGRect(x: 20.0, y: 20.0, width: 130.0, height: 100.0)
        context?.setFillColor(NSColor(red: 0.482, green: 0.62, blue: 0.871, alpha: 1.0).cgColor)
        context?.stroke(ourRect, width: 3.0)
    }
    
    func doClippedCircle(context: CGContext?) {
        let circleCenter = CGPoint(x: 150.0, y: 150.0)
        let circleRadius = CGFloat(100.0)
        let startAngle = 0.0
        let endAngle = Double.pi * 2
        let ourRect = CGRect(x: 65.0, y: 65.0, width: 170.0, height: 170.0)
        
        // ***** Filled Circle *****
        context?.setFillColor(NSColor.init(red: 0.663, green: 0.0, blue: 0.031, alpha: 1.0).cgColor)
        context?.beginPath()
        // Construct the circle path counterclockwise.
        context?.addArc(center: circleCenter, radius: circleRadius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        context?.drawPath(using: .fill)
        
        // ***** Stroked Square *****
        context?.stroke(ourRect)
        
        // Translate so that next drawing doesn't overlap what
        // has already been drawn.
        context?.translateBy(x: ourRect.size.width + circleRadius + 5.0, y: 0)
        
        // Create a rectangular path and clip to that path.
        context?.beginPath()
        context?.addRect(ourRect)
        context?.clip()
        
        // ***** Clipped circle *****
        context?.beginPath()
        context?.addArc(center: circleCenter, radius: circleRadius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        context?.drawPath(using: .fill)
    }
}
