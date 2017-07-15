//
//  Building.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import MapKit

struct Building {
    
    let name: String
    let abbreviation: String
    let locationCoordinate: CLLocationCoordinate2D
    let classrooms: [Classroom]
    
    init(name: String, abbreviation: String, location: CLLocationCoordinate2D, classrooms: [Classroom] = []) {
        
        self.name = name
        self.abbreviation = abbreviation
        self.locationCoordinate = location
        self.classrooms = classrooms
    }
}

final class BuildingAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    let building: Building
    
    init(_ building: Building) {
        
        self.building = building
        self.title = building.name
        self.subtitle = String(building.classrooms.count) + " Classrooms Available"
        self.coordinate = building.locationCoordinate
    }
}
