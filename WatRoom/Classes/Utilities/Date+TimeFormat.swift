//
//  Date+TimeFormat.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

extension Date {
    
    static func twentyFourHoursToTwelveHours(time: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        if let inDate = dateFormatter.date(from: time) {
            dateFormatter.dateFormat = "h:mm a"
            let outTime = dateFormatter.string(from: inDate)
            return outTime
        }
        
        return ""
    }
    
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
}
