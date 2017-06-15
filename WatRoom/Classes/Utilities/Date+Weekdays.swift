//
//  Date+Weekdays.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

enum Weekday: String {
    case Monday = "MON"
    case Tuesday = "TUE"
    case Wednesday = "WED"
    case Thursday = "THU"
    case Friday = "FRI"
    case Saturday = "SAT"
    case Sunday = "SUN"
}

func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

extension Date {
    
    static func getCurrentWeekday() -> Weekday {
        let myWeekday = Calendar.current.dateComponents([.weekday], from: Date()).weekday!
        switch myWeekday {
        case 1:
            return Weekday.Sunday
        case 2:
            return Weekday.Monday
        case 3:
            return Weekday.Tuesday
        case 4:
            return Weekday.Wednesday
        case 5:
            return Weekday.Thursday
        case 6:
            return Weekday.Friday
        case 7:
            return Weekday.Saturday
        default:
            break
        }
        return Weekday.Sunday
    }
}
