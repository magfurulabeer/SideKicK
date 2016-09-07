//
//  SideKicK.swift
//  SideKicK Helper Methods
//
//  Created by Magfurul Abeer on 9/4/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//
// SideKicK is a collection of helper methods to speed up the development process


import UIKit

// TODO:

extension String {
    
    /// Subscripting returns a string of
    subscript(index: Int) -> String {
        get {
            let referenceIndex = index >= 0 ? self.startIndex : self.endIndex
            return String( self[referenceIndex.advancedBy(index)] )
        }
    }
    
    func char() -> Character {
        return self[self.startIndex]
    }
    
    /// Returns length of the String
    func length() -> Int {
        return self.characters.count
    }
    
    /// Alias: stringByReplacingOccurrencesOfString(target: String, withString replacement: String)
    func replace(target: String, withString replacement: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: replacement)
    }
    
    /// Same as replace but permanently modifies reciever.
    mutating func _replace(target: String, withString replacement: String) {
        self = self.stringByReplacingOccurrencesOfString(target, withString: replacement)
    }
    
    /// Returns substring starting from and ending by given parameters
    /// The substring will not include character at index number 'to'
    func substring(from: Int, to: Int) -> String? {
        if from >= 0 && to >= 0 && to <= self.characters.count {
            let startIndex = self.startIndex.advancedBy(from)
            let endIndex = self.startIndex.advancedBy(to - 1)
            
            return self.substringToIndex(endIndex).substringFromIndex(startIndex)
        } else {
            return nil
        }
    }

    /// Returns substring starting from and ending at given parameters
    /// The substring will include character at index number 'through'
    func substring(from: Int, through: Int) -> String? {
        if from >= 0 && through >= 0 && through < self.characters.count {
            let startIndex = self.startIndex.advancedBy(from)
            let endIndex = self.startIndex.advancedBy(through)
            
            return self.substringToIndex(endIndex).substringFromIndex(startIndex)
        } else {
            return nil
        }
    }
    
    /// Returns substring starting from given parameter and ending 'by' indexes after
    /// The parameter 'by' does not include the initial index
    func substring(from: Int, by: Int) -> String? {
        if from >= 0 && by >= 0 && by < self.characters.count {
            let startIndex = self.startIndex.advancedBy(from)
            let endIndex = startIndex.advancedBy(by)
            
            return self.substringToIndex(endIndex).substringFromIndex(startIndex)
        } else {
            return nil
        }
    }
    
    /// Returns substring starting from and with the size of the given parameters
    /// The parameter 'size' does include the initial index
    func substring(start: Int, size: Int) -> String? {
        if size == 0 {
            return ""
        }
        if start >= 0 && size > 0 && (start + size) <= self.characters.count {
            let startIndex = self.startIndex.advancedBy(start)
            let endIndex = startIndex.advancedBy(size - 1)
            
            return self.substringToIndex(endIndex).substringFromIndex(startIndex)
        } else {
            return nil
        }
    }
}

extension UIColor {
    
    // Returns the proper UIColor for given hexCode
    // Hex code may include "#"
    func colorWithHexCode(hexCode: String) -> UIColor? {
        let code = hexCode.stringByReplacingOccurrencesOfString("#", withString: "").uppercaseString
        
        if code.characters.count == 6 {
            let red = CGFloat(strtoul(hexCode.substring(0, size: 2)!, nil, 16))
            let green = CGFloat(strtoul(hexCode.substring(0, size: 2)!, nil, 16))
            let blue = CGFloat(strtoul(hexCode.substring(0, size: 2)!, nil, 16))
            
            return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        }
        return nil
    }
    
    //    class func colorFromImage(atPoint point: CGPoint) {
    //        var pixel : [UInt8] = [0, 0, 0, 0]
    //        let colorSpace = CGColorSpaceCreateDeviceRGB()
    //        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue).rawValue
    //        let context = CGBitmapContextCreate(UnsafeMutablePointer(pixel), 1, 1, 8, 4, colorSpace, bitmapInfo)
    //        CGContextTranslateCTM(context, -point.x, -point.y)
    //
    //        return UIColor(colorLiteralRed: Float(pixel[0])/255.0, green: Float(pixel[1])/255.0, blue: Float(pixel[2])/255.0, alpha: Float(pixel[3])/255.0)
    //    }
    //
    //    class func colorFromImage(image: UIImage, atPoint point: CGPoint) {
    //        var pixel : [UInt8] = [0, 0, 0, 0]
    //        let colorSpace = CGColorSpaceCreateDeviceRGB()
    //        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue).rawValue
    //        let context = CGBitmapContextCreate(UnsafeMutablePointer(pixel), 1, 1, 8, 4, colorSpace, bitmapInfo)
    //        CGContextTranslateCTM(context, -point.x, -point.y)
    //
    //        return UIColor(colorLiteralRed: Float(pixel[0])/255.0, green: Float(pixel[1])/255.0, blue: Float(pixel[2])/255.0, alpha: Float(pixel[3])/255.0)
    //    }
    
    /*
     - (UIColor *) colorOfPoint:(CGPoint)point
     {
     unsigned char pixel[4] = {0};
     
     CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
     
     CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedLast);
     
     CGContextTranslateCTM(context, -point.x, -point.y);
     
     [self.layer renderInContext:context];
     
     CGContextRelease(context);
     CGColorSpaceRelease(colorSpace);
     
     //NSLog(@"pixel: %d %d %d %d", pixel[0], pixel[1], pixel[2], pixel[3]);
     
     UIColor *color = [UIColor colorWithRed:pixel[0]/255.0 green:pixel[1]/255.0 blue:pixel[2]/255.0 alpha:pixel[3]/255.0];
     
     return color;
     }
     */
    
    // ERROR
    //    convenience init?(hexCode: String ) {
    //        let code = hexCode.stringByReplacingOccurrencesOfString("#", withString: "").uppercaseString
    //
    //        if code.characters.count == 6 {
    //            let red = CGFloat(strtoul(hexCode.substring(0, size: 2)!, nil, 16))/255
    //            let green = CGFloat(strtoul(hexCode.substring(0, size: 2)!, nil, 16))/255
    //            let blue = CGFloat(strtoul(hexCode.substring(0, size: 2)!, nil, 16))/255
    //            self.init(red: red, green: green, blue: blue, alpha: 1)
    //            
    //        }
    //        return nil
    //    }
}


extension UIView {
    
    
    enum Direction {
        case Down
        case Up
        case Left
        case Right
        case UpLeft
        case UpRight
        case DownLeft
        case DownRight
    }
    
    /// Adds a gradient to the entire screen
    /// By default, the gradient goes from top to bottom
    func addFullScreenGradient(startColor: UIColor, endColor: UIColor){
        
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.CGColor, endColor.CGColor]
        gradient.frame = self.frame
        self.layer.addSublayer(gradient)
        
    }
    
    /// Adds a gradient to the entire screen
    /// The direction of the gradient is defined by the start and end points
    /// The points are on an axis of -1 to 1 for both X and Y
    func addFullScreenGradient(startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.CGColor, endColor.CGColor]
        gradient.frame = self.frame
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        self.layer.addSublayer(gradient)
    }
    
    /// Adds a gradient to the entire screen with specified direction
    func addFullScreenGradient(startColor: UIColor, endColor: UIColor, direction: Direction) {
        
        /// Returns the proper start and end points for specific directions
        func pointsForDirection(direction: Direction) -> (CGPoint, CGPoint) {
            switch direction {
            case .Down:
                return (CGPoint(x: 0.5, y: 0), CGPoint(x: 0.5, y: 1))
            case .Up:
                return (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
            case .Left:
                return (CGPoint(x: 1, y: 0.5), CGPoint(x: 0, y: 0.5))
            case .Right:
                return (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
            case .UpLeft:
                return (CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 0))
            case .UpRight:
                return (CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0))
            case .DownLeft:
                return (CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1))
            case .DownRight:
                return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1))
            }
        }
        
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.CGColor, endColor.CGColor]
        gradient.frame = self.frame
        let points = pointsForDirection(direction)
        gradient.startPoint = points.0
        gradient.endPoint = points.1
        self.layer.addSublayer(gradient)
        
    }
    
    
}




extension Int {
    /// An easy way to run a block of code X number of times
    func times(block: () -> ()) {
        for _ in 0..<self {
            block()
        }
    }
    
    func upTo(x: Int, block: (Int) -> ()) {
        for i in self...x {
            block(i)
        }
    }
    
    func downTo(x: Int, block: (Int) -> ()) {
        for i in self.stride(through: x, by: -1) {
            block(i)
        }
    }
    
    func step(to: Int, by: Int, block: (Int) -> ()) {
        for i in self.stride(through: to, by: by) {
            block(i)
        }
    }
    
}







