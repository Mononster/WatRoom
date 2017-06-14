//
//  Date.swift
//  WatRoom
//
//  Created by Aaron Zhang on 2017-06-14.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import SQLite

extension Date{
    static var declaredDatatype: String {
        return String.declaredDatatype
    }
    static func fromDatatypeValue(stringValue: String) -> Date {
        return SQLDateFormatter.date(from: stringValue)!
    }
    var datatypeValue: String {
        return SQLDateFormatter.string(from: self)
    }
}

let SQLDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}()
