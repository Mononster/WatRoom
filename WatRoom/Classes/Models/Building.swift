//
//  Building.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import MapKit

let backendless = Backendless.sharedInstance()

struct Building {
    
    let name: String
    let location: CLLocation
    
    let classrooms: [Classroom]
}
