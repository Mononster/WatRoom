//
//  ClassroomsManager.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation

private let classroomsManager = ClassroomsManager()

class ClassroomsManager {
    
    class var sharedInstance: ClassroomsManager {
        return classroomsManager
    }
    
    let buildings: [Building] = MockData.generateBuildings()
    
    var buildingsFilter: [Bool] = []
    var distanceFilter: [Bool] = []
    
    var dayFilter = Day(name: .monday)
    var timeFilter: (start: Date, end: Date) = (Date(), Date())
}
