//
//  Database.swift
//  WatRoom
//
//  Created by Ali Ajmine on 7/14/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import Firebase

class Database {
    
    class func configure() {
        FIRApp.configure()
    }
    
    class func fetchBuildings(completion: @escaping (_ buildings: [Building]) -> Void) {
        var scheduleData: [String: [Classroom]] = [:]
        
        let scheduleRef = FIRDatabase.database().reference(withPath: "schedule")
        
        scheduleRef.observe(.value, with: { dict in
            guard let scheduleDict = dict.value as? [String: Any] else { return }

            for (building, info) in scheduleDict {
                guard let classroomsDict = info as? [String: Any] else { continue }
                var classrooms: [Classroom] = []
                
                for (classroom, info) in classroomsDict {
                    guard let availabilityDict = info as? [String: Any] else { continue }
                    var availability: [Day: [Bool]] = [:]
                    
                    for day in Day.weekdays {
                        guard let availabilityString = availabilityDict[day.abbreviation] as? String else { continue }
                        availability[day] = getAvailability(fromString: availabilityString)
                    }
                    
                    let classroom = Classroom(room: classroom, availability: availability)
                    classrooms.append(classroom)
                }
                
                scheduleData[building] = classrooms.sorted{ $0.roomNumber < $1.roomNumber }
            }

            fetchBuildings(withScheduleData: scheduleData, completion: { (buildings: [Building]) in
                completion(buildings)
            })
        })
    }
    
    private class func fetchBuildings(withScheduleData schedule: [String: [Classroom]],
                              completion: @escaping (_ buildings: [Building]) -> Void) {
        var buildings: [Building] = []
        let buildingsRef = FIRDatabase.database().reference(withPath: "buildings")

        buildingsRef.observe(.value, with: { dict in
            guard let buildingsDict = dict.value as? [String: Any] else { return }
            
            for (buildingAbbrev, info) in buildingsDict {
                guard
                    let infoDict = info as? [String: Any],
                    let classrooms = schedule[buildingAbbrev],
                    let name = infoDict["name"] as? String,
                    let latitude = infoDict["latitude"] as? Double,
                    let longitude = infoDict["longitude"] as? Double,
                    latitude != 0, longitude != 0 else { continue }
                
                let location = String(format: "%f, %f", latitude, longitude).coordinates
                let building = Building(name: name, abbreviation: buildingAbbrev, location: location, classrooms: classrooms)
                
                buildings.append(building)
            }
            
            completion(buildings.sorted { $0.abbreviation < $1.abbreviation })
        })
    }
}

extension Database {
    
    fileprivate class func getAvailability(fromString string: String) -> [Bool] {
        let characters = Array(string.characters)
        var availability: [Bool] = []
        
        for character in characters {
            availability.append(String(character).bool)
        }
        
        return availability
    }
}
