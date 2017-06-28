//
//  SideKicK.swift
//  SideKicK Helper Methods
//
//  Created by Magfurul Abeer on 9/4/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//
// SideKicK is a collection of convenient extensions to speed up the development process


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



// Mark: Int Extensions 

extension Int {
    /**
     Swift port of the Ruby #times
     An easy way to run a block of code n times
     
     Eg:
     
     3.times {
        print("Beetlejuice")
     }
     
     >> Beetlejuice
     >> Beetlejuice
     >> Beetlejuice
     
     - Parameters:
     - block: Block of code that should be run n times
     */
    func times(block: () -> ()) {
        for _ in 0..<self {
            block()
        }
    }
    
    /**
     Swift port of the Ruby #upTo
     
     Eg:
     
     1.upTo(5) { n in
        print(n)
     }
     
     >> 1
     >> 2
     >> 3
     >> 4
     >> 5
     
     - Parameters:
     - block: Block of code that should be run for every number from x up to y
     */
    func upTo(_ x: Int, block: (Int) -> ()) {
        for i in self...x {
            block(i)
        }
    }
    
    /**
     Swift port of the Ruby #downTo
     
     Eg:
     
     3.upTo(1) { n in
        print(n)
     }
     
     >> 3
     >> 2
     >> 1
     
     - Parameters:
     - block: Block of code that should be run for every number from y down to x
     */
    func downTo(_ x: Int, block: (Int) -> ()) {
        for i in self.stride(through: x, by: -1) {
            block(i)
        }
    }
    
    /**
     Swift port of the Ruby #step
     
     Eg:
     
     0.step(10, 2) { n in 
        print(n)
     }
     
     >> 0
     >> 2
     >> 4
     >> 6
     >> 8
     >> 10
     
     - Parameters:
     - block: Block of code that should be run for every number from y down to x
     */
    func step(_ to: Int, _ by: Int, block: (Int) -> ()) {
        for i in self.stride(through: to, by: by) {
            block(i)
        }
    }
    
    /**
     Convenient way to get ordinal version of number
     
     Eg:
     
     5.ordinal
     
     >> 5th
     */
    var ordinal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? ""
    }
    
    /**
     Convenient way to get spelled out version of number
     
     Eg:
     
     5.spelledOut
     
     >> five
     */
    var spelledOut: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? ""
    }
    
    /**
     Convenient way to get number in scientific notation
     
     Eg:
     
     123.scientific
     
     >> 1.23E2
     */
    var scientific: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? ""
    }
    
    /**
     Convenient way to get currency form of your number
     
     Eg:
     
     123.currency
     
     >> $123
     */
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? ""
    }
    
    var ok: Int {
        return 0
    }
    
}



// Mark: Date Extensions
extension Date {
    
    var shortDate: String {
        return DateFormatter.string(from: self, date: .short, time: .none)
    }
    
    var shortTime: String {
        return DateFormatter.string(from: self, date: .none, time: .short)
    }
    
    var fillDateTime: String {
        return DateFormatter.string(from: self, date: .full, time: .full)
        
    }
    
    var militaryTime: String {
        return DateFormatter.string(from: self, format: "HH:mm")
    }
    
    var zuluTime: String {
        return DateFormatter.string(from: self, format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var startOfWeek: Date {
        let date = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
        let dslTimeOffset = NSTimeZone.local.daylightSavingTimeOffset(for: date)
        return date.addingTimeInterval(dslTimeOffset)
    }
    
    var endOfWeek: Date {
        return Calendar.current.date(byAdding: .day, value: 6, to: self.startOfWeek)!
    }
    
    var dayOfWeek: Int? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        return weekDay
    }
    
    var nextWeek: Date {
        return Calendar.current.date(byAdding: .second,
                                     value: Int(7.days.toSeconds),
                                     to: self).or(self)
    }
    
    var lastWeek: Date {
        return Calendar.current.date(byAdding: .second,
                                     value: Int(-7.days.toSeconds),
                                     to: self).or(self)
    }

    func after(seconds: Int) -> Date {
        return Calendar.current.date(byAdding: .seconds,
                                     value: minutes,
                                     to: self).or(self)
    }
    
    func after(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute,
                                     value: minutes,
                                     to: self).or(self)
    }
    
    func after(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day,
                                     value: days,
                                     to: self).or(self)
    }
    
    func after(months: Int) -> Date {
        return Calendar.current.date(byAdding: .month,
                                     value: months,
                                     to: self).or(self)
    }
    
    func after(hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour,
                                     value: hours,
                                     to: self).or(self)
    }
    
    func isBefore(day: Date) -> Bool {
        let comparison = Calendar.current.compare(self, to: day, toGranularity: Calendar.Component.day)
        return comparison == .orderedAscending
    }
    
    func isBefore(minutes: Date) -> Bool {
        let comparison = Calendar.current.compare(self, to: minutes, toGranularity: Calendar.Component.minute)
        return comparison == .orderedAscending
    }
    
    func isSame(day: Date) -> Bool {
        let comparison = Calendar.current.compare(self, to: day, toGranularity: Calendar.Component.day)
        return comparison == .orderedSame
    }
    
    func isAfter(day: Date) -> Bool {
        let comparison = Calendar.current.compare(self, to: day, toGranularity: Calendar.Component.day)
        return comparison == .orderedDescending
    }
    
    func isAfter(minutes: Date) -> Bool {
        let comparison = Calendar.current.compare(self, to: minutes, toGranularity: Calendar.Component.minute)
        return comparison == .orderedDescending
    }
    
    func toString(format:String) -> String? {
        return DateFormatter(format: format).string(from: self)
    }
    
    static func next15MinuteInterval() -> Date {
        let calendar = Calendar.current
        let minutes = calendar.component(Calendar.Component.minute, from: Date())
        
        let minutesPast15MinuteInterval = minutes % 15
        let minutesTo15MinuteInterval = 15 - minutesPast15MinuteInterval
        
        let date = Date().after(minutes: minutesTo15MinuteInterval)
        
        return date
    }
}

// Mark: DateFormatter Extensions
extension DateFormatter {
    class func string(from fromDate: Date,
                      date dateStyle: DateFormatter.Style,
                      time timeStyle: DateFormatter.Style) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = dateStyle
        dateFormater.timeStyle = timeStyle
        return dateFormater.string(from: fromDate)
    }
    
    class func string(from fromDate: Date, format: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.string(from: fromDate)
    }
    
    convenience init (format: String) {
        self.init()
        dateFormat = format
        locale = Locale.current
    }
}


/*
 TODO:
 
 Arrays
    prepend
    flatten
    flattenDeep
    isUnique
    unique
    
 
 String
    trim
 */






