//
//  DateExtensions.swift
//  Messenger
//
//  Created by mpc on 10/15/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

extension Date {
    var microDate: String {
        let fmt  = DateFormatter()
        fmt.dateFormat = "MM-dd"
        let shortDate: String = fmt.string(from: self)
        
        return shortDate
    }

    var shortDate: String {
        let fmt  = DateFormatter()
        fmt.dateFormat = "MM-dd-yyyy"
        let shortDate: String = fmt.string(from: self)
        
        return shortDate
    }
    
    var shortTime: String {
        let calendar = Calendar.current
        var hour = (calendar as NSCalendar).component(NSCalendar.Unit.hour, from: self)
        let minute = (calendar as NSCalendar).component(NSCalendar.Unit.minute, from: self)
        var ampmFlag = "am"
        
        switch hour {
        case 12...23:
            hour = hour - 12
            ampmFlag = "pm"
        case 0:
            hour = 12
            ampmFlag = "am"
        default: break
        }
        
        let shortTime = "\(String(format: "%01d", hour)):\(String(format: "%02d", minute)) \(ampmFlag)"
        
        return shortTime
    }
}
