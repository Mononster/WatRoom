//
//  ClassroomsManager.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import MapKit

private let classroomsManager = ClassroomsManager()

class ClassroomsManager {
    
    class var sharedInstance: ClassroomsManager {
        return classroomsManager
    }
    
    var buildings: [Building] = []
    
    var buildingsFilter: [Bool] = []
    var distanceFilter: [Bool] = []
    
    var distanceFilterDistance: CLLocationDistance? {
        let size = 3
        guard distanceFilter.count >= size else { return nil }
        
        if distanceFilter[0] {
            return CLLocationDistance(100)
        } else if distanceFilter[1] {
            return CLLocationDistance(500)
        } else if distanceFilter[2] {
            return CLLocationDistance(1000)
        }
        
        return nil
    }
    
    var dayFilter = Day(name: .friday)
    var timeFilter: (start: Date, end: Date)?
    
    func fetchData(completion: @escaping (_ buildings: [Building]) -> Void) {
        Database.fetchBuildings { (buildings: [Building]) in
            self.buildings = buildings
            completion(buildings)
        }
    }
}
