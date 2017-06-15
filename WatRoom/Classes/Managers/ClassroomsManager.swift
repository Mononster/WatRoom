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
    
    private(set) var buildings: [Building] = []
    
    
}
