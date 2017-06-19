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
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
