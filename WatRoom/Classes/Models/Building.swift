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

func CSVToArray(CSV: String) -> [String] {
    let temp = CSV.components(separatedBy: ",")
    return temp
}

func ArrayToCSV(array: [String]) -> String {
    var temp: String = ""
    for s in array {
        temp.append(s)
        if array.index(of: s) != array.count - 1 {
            temp.append(",")
        }
    }
    return temp
}

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
    }

    init?(buildingCode : String) {
        let ID = buildingCode
        var result: Building?
        if let building = getLocalCopyByID(ID: ID) {
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
    
    /* probably not needed for Building, can be used for classroom
     
    func getServerCopyByID(ID: String) -> Building? {
        var error:String = ""
        var building : Building? = nil
        if let backendless = Backendless.sharedInstance() {
            if let dataStore = backendless.data.of(Building.ofClass()) {
                let query : DataQueryBuilder = DataQueryBuilder()
                query.setWhereClause("buildingCode='" + ID + "'")
                dataStore.find(query,
                               response:{(result : [Any]?) -> Void in
                                let result = result!
                                if result.count == 0 {
                                    error = "Building with ID:" + ID + " not found"
                                }else {
                                    building = (result[0] as! Building)
                                }
                },
                               error:{(e:Fault?) -> Void in
                                if let e = e {
                                    error = e.detail
                                }
                })
            }else {
                error = "dataStore for Building not initialized properly"
            }
        }else {
            error = "Backendless not initialized properly"
        }
        
        if building == nil {
            NSLog(error)
        }
        return building
    }
    */
    
    func getLocalCopyByID(ID: String) -> Building? {
        do {
            let db = try Connection("Library/Application support/db.sqlite3")
            let buildings = Table("Buildings")
            for building in try db.prepare(buildings) {
                let buildingCode = Expression<String>("buildingCode")
                //let expiryDate = Expression<Date>("expiryDate")
                if building[buildingCode] == ID {
                    //if building[expiryDate] <= Date() {
                        //let freshBuilding = getServerCopyByID(ID: ID)
                    //}
                    let classroomIDS = CSVToArray(CSV: building[Expression<String>("classrooms")])
                    
                    var crooms = [Classroom]()
                    
                    for cID in classroomIDS {
                        crooms.append(Classroom(cID))
                    }
                    
                    return Building(buildingCode: ID,
                                    buildingName: building[Expression<String>("buildingName")],
                                    latitude: building[Expression<Double>("latitude")],
                                    longitude: building[Expression<Double>("longitude")],
                                    classrooms: crooms)
                }
            }
        }catch let error as NSError{
            NSLog(error.description)
        }
        return nil
    }
    
    /*
        shouldn't be needed
    func save() -> Bool {
        var result : Bool = true
        if let backendless = Backendless.sharedInstance() {
            if let dataStore = backendless.data.of(Building.ofClass()) {
                dataStore.save(self, response: nil, error: {(error:Fault?) -> Void in
                    if let error = error {
                        NSLog(error.detail)
                        result = false
                    }else {
                        result = true
                    }
                })
            }
        }
        return result
    }
    */
}
