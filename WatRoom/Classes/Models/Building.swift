//
//  Building.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import MapKit
import SQLite

class Building : NSObject{
    
    let buildingCode: String
    let buildingName: String
    let latitude: Double
    let longitude: Double
    let classrooms: [Classroom]

    init(buildingCode: String, buildingName: String, latitude: Double, longitude: Double, classrooms: [Classroom]) {
        self.buildingCode = buildingCode
        self.buildingName = buildingName
        self.latitude = latitude
        self.longitude = longitude
        self.classrooms = classrooms
    }

    init?(buildingCode : String) {
        let ID = buildingCode
        var result: Building?
        if let building = Building.getLocalCopyByID(ID: ID) {
            result = building
        }else {
            return nil
        }
        let final = result!
        self.buildingCode = final.buildingCode
        self.buildingName = final.buildingName
        self.latitude = final.latitude
        self.longitude = final.longitude
        self.classrooms = final.classrooms
    }
    
    static func initTable() -> Bool {
        var db : Connection
        do {
            let db = try Connection("Library/Application support/db.sqlite3")
        }catch {
            return false
        }
        let buildingCode = Expression<String>("buildingCode")
        let buildingName = Expression<String>("buildingName")
        let latitude = Expression<Double>("latitude")
        let longitude = Expression<Double>("longitude")
        let classrooms = Expression<String>("classrooms")
        do {
            let stmt = try db.prepare("SELECT name FROM sqlite_master WHERE type='table' AND name='Buildings'")
            for row in stmt {
                for (index, name) in stmt.columnNames.enumerated() {
                    NSLog("Table \"Building\" already exists, proceeding...")
                    return true
                }
            }
        } catch {
            NSLog("stmt Error")
            return false
        }
        let buildings = Table("Buildings")
        do {
            try db.run(buildings.create(ifNotExists: true) { t in
                t.column(buildingCode, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
                t.column(buildingName)  //     "email" TEXT UNIQUE NOT NULL,
                t.column(latitude)
                t.column(longitude)
                t.column(classrooms)
                })
        }catch {
            return false
        }
        
        var results : [Building]
        if let backendless = Backendless.sharedInstance() {
            if let dataStore = backendless.data.of(Building.ofClass()) {
                do {
                    try results = dataStore.find()
                }catch {
                    NSLog("Downloading failed, check your internet connection!")
                    return false
                }
            }else {
                return false
            }
        }else {
            return false
        }
        for b in results {
            do {
                try db.run(buildings.insert(or: .replace,
                    buildingCode <- b.buildingCode,
                    buildingName <- b.buildingName,
                    latitude <- b.latitude,
                    longitude <- b.longitude,
                    classrooms <- b.classrooms))
            }catch {
                NSLog("An error has happened")
                return false
            }
        }
        return true
    }
    
    static func getLocalCopyByID(ID: String) -> Building? {
        do {
            let db = try Connection("Library/Application support/db.sqlite3")
            let buildingCode = Expression<String>("buildingCode")
            let buildings = Table("Buildings")
            for building in try db.prepare(buildings.filter(buildingCode == ID)) {
                    let classroomIDS = CSVToArray(CSV: building[Expression<String>("classrooms")])
                    
                    var crooms = [Classroom]()
                    
                    for cID in classroomIDS {
                        crooms.append(Classroom(ID: cID))
                    }
                    
                    return Building(buildingCode: ID,
                                    buildingName: building[Expression<String>("buildingName")],
                                    latitude: building[Expression<Double>("latitude")],
                                    longitude: building[Expression<Double>("longitude")],
                                    classrooms: crooms)
            }
        }catch let error as NSError{
            NSLog(error.description)
        }
        return nil
    }
}
