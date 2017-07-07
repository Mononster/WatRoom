//
//  Classroom.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import SQLite
import FirebaseDatabase

final class Classroom : NSObject{
    static let weekDays = ["M", "T", "W", "Th", "F"]
    let classroomCode : String
    let schedule: [[Bool]]
    var availability = true
    
    init(classroomCode: String) {
        self.classroomCode = classroomCode
        do {
            let db = try Connection("Library/Application support/db.sqlite3")
            let classrooms = Table("Classrooms")
            let classroom = try db.prepare(classrooms.where(classroomCode == "0"))
            
            
        } catch let error as NSError{
            NSLog(error.description)
        }
    }
    
    static func initTable() -> Bool {
        var db : Connection
        do {
            db = try Connection("Library/Application support/db.sqlite3")
        }catch {
            return false
        }
        
        do {
            let stmt = try db.prepare("SELECT name FROM sqlite_master WHERE type='table' AND name='Buildings'")
            for _ in stmt {
                for (_, _) in stmt.columnNames.enumerated() {
                    NSLog("Table \"Building\" already exists, proceeding...")
                    return true
                }
            }
        } catch {
            NSLog("stmt Error")
            return false
        }
        
        let classroomID = Expression<String>("classroomID")
        let classrooms = Table("Classrooms")
        do {
            try db.run(classrooms.create(ifNotExists: true) { t in
                t.column(classroomID, primaryKey: true)
                for day in weekDays {
                    var time = 700
                    while time < 2300 {
                        let key = Expression<String>(day + String(time))
                        t.column(key)
                        time += 10
                        time += (time % 100 == 60) ? 40 : 0
                    }
                }
            })
        }catch {
            return false
        }
        
        let classroomsRef = Backend.ref.child("classrooms")
        
        classroomsRef.observeSingleEvent(of: .value, with: {(snapshot) in
            for s in snapshot.children {
                let c = s as! DataSnapshot
                do {
                    try db.run(classrooms.insert(or: .replace,
                                                classroomID <- c.value(forKey: "classroomID") as! String
                                                
                                                ))
                }catch {
                    NSLog("An error has happened")
                    return false
                }
                
                
                let building = Building(buildingCode: c.key,
                                        buildingName: c.value(forKey: "name") as! String,
                                        latitude: c.value(forKey: "latitude") as! Double,
                                        longitude: c.value(forKey: "longitude") as! Double,
                                        classrooms: c.value(forKey: "classrooms")  as! [String])
            }
        })
        
        
        for b in results {
            do {
                try db.run(buildings.insert(or: .replace,
                                            buildingCode <- b.buildingCode,
                                            buildingName <- b.buildingName,
                                            latitude <- b.latitude,
                                            longitude <- b.longitude,
                                            classrooms <- Backend.ArrayToCSV(array: b.classrooms)))
            }catch {
                NSLog("An error has happened")
                return false
            }
        }
        
    }
    
    
    static func getLocalCopyByID(classroomCode: String) -> Classroom? {
        do {
            let db = try Connection("Library/Application support/db.sqlite3")
            let classrooms = Table("Classrooms")
            let classroom = try db.prepare(classrooms.where(classroomCode == "0"))
            if classroom.count > 0 {
                let schedule = CSVToArray(CSV: classroom[0][Expression<String>("schedule")])
                let availability = classroom[0][Expression<String>("availability")]
                return Classroom(classroomCode: classroomCode)
            }
            
        } catch let error as NSError{
            NSLog(error.description)
        }
        return nil
    }
}








