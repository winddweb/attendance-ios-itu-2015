//
//  Utility.swift
//  Attendance Tracker
//
//  Created by Yifeng on 10/25/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit

// format time and date
extension NSDate {
    func dateFromString(date: String, format: String) -> NSDate {
        
        let formatter = NSDateFormatter()
        let locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        formatter.locale = locale
        formatter.dateFormat = format
        
        return formatter.dateFromString(date)!
    }
    
    func stringFromDate(date: NSDate, format: String) -> String {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.stringFromDate(date)
        
    }
}

