//
//  Day.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/17/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation

struct Day {
    
    enum Name: String {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    
    static var weekdays = [Day(name: .monday),
                           Day(name: .tuesday),
                           Day(name: .wednesday),
                           Day(name: .thursday),
                           Day(name: .friday)]
    
    let name: Name
    
    init(name: Name) {
        self.name = name
    }
    
    static func atIndex(_ index: Int) -> Day {
        switch index {
        case 0:
            return Day(name: .monday)
        case 1:
            return Day(name: .tuesday)
        case 2:
            return Day(name: .wednesday)
        case 3:
            return Day(name: .thursday)
        case 4:
            return Day(name: .friday)
        case 5:
            return Day(name: .saturday)
        case 6:
            return Day(name: .sunday)
        default:
            return Day(name: .monday)
        }
    }
    
}

extension Day: Equatable {
    
    static func == (lhs: Day, rhs: Day) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Day: Hashable {
    
    var hashValue: Int {
        return name.hashValue
    }
}
