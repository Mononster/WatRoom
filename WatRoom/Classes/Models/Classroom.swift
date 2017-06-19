//
//  Classroom.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation


struct Classroom {
    
    let roomNumber: String
    let availability: [Day: [Bool]]
    let features: [Feature]
    
    init(room: String, availability: [Day: [Bool]], features: [Feature] = []) {
        self.roomNumber = room
        self.availability = availability
        self.features = features
    }
}
