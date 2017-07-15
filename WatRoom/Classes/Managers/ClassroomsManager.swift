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
    
    var buildings: [Building] = []
    
    var buildingsFilter: [Bool] = []
    var distanceFilter: [Bool] = []
    
    var dayFilter = Day(name: .monday)
    var timeFilter: (start: Date, end: Date) = (Date(), Date())
    
    func fetchData(completion: @escaping (_ buildings: [Building]) -> Void) {
        Database.fetchBuildings { (buildings: [Building]) in
            self.buildings = buildings
            completion(buildings)
        }
    }
}
