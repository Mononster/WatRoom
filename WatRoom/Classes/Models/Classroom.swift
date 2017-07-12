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
    let schedule: [String:Bool]
    
    init(classroomCode: String) {
        self.classroomCode = classroomCode
        var code = Expression<String>("classroomCode")
        do {
            let db = try Connection("Library/Application support/db.sqlite3")
            let classrooms = Table("Classrooms")
            let classroom = try db.prepare(classrooms.where(classroomID == classroomCode))
            if classroom.count > 0 {
                var start = 700
                let end = 2300
                while start < end {
                    for day in weekDays {
                        let time = day+String(start)
                        self.schedule[time] = classroom[0][Expression<String>(time)]
                    }
                    start += 10
                    if start % 100 == 60 {
                        start += 40
                    }
                }
            }
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
        
        //creating classroom table
        let classrooms = Table("Classrooms")
        let classroomID = Expression<String>("classroomID")
        let buildingName = Expression<String>("buildingName")
        let Monady = Expression<String>("Monady")
        let Tuesday = Expression<String>("Tuesday")
        let Wednesday = Expression<String>("Wednesday")
        let Thursday = Expression<String>("Thursday")
        let Friday = Expression<String>("Friday")
        let powerOutlet = Expression<Bool>("powerOutlet")
        let Capacity = Expression<String>("Capacity")
        do {
            try db.run(classrooms.create(ifNotExists: true) { t in
                t.column(classroomID, primaryKey: true)
                t.column(buildingName)
                t.column(Monady)
                t.column(Tuesday)
                t.column(Wednesday)
                t.column(Thursday)
                t.column(Friday)
                t.column(powerOutlet)
                t.column(Capacity)
            })
        }catch {
            return false
        }
        
        let classroomsRef = Backend.ref.child("schedule")
        
        classroomsRef.observeSingleEvent(of: .value, with: {(snapshot) in
            for b in snapshot.children {
                let bname = b as! DataSnapshot
                
            }
            
            
            for s in snapshot.children {
                let c = s as! DataSnapshot
                do {
                    try db.run(classrooms.insert(or: .replace,
                                                 classroomID <- c.value(forKey: "classroomID") as! String
                                                 ))
                    for 
                }catch {
                    NSLog("An error has happened")
                    return false
                }

                
            }
        })
        let building = Building(buildingCode: b.key,
                                buildingName: b.childSnapshot(forPath: "name").value as! String,
                                latitude: b.childSnapshot(forPath: "latitude").value as! Double,
                                longitude: b.childSnapshot(forPath: "longitude").value as! Double,
                                classrooms: b.childSnapshot(forPath: "classrooms").value  as! [String])
        
        
    }
}








