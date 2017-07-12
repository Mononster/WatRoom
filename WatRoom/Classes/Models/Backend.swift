//
//  Backend.swift
//  WatRoom
//
//  Created by a52zhang on 2017-06-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import SQLite
import Firebase

class Backend{
    
    static var ref: DatabaseReference!
    
    static func CSVToArray(CSV: String) -> [String] {
        let temp = CSV.components(separatedBy: ",")
        return temp
    }
    
    static func ArrayToCSV(array: [String]) -> String {
        var temp: String = ""
        for s in array {
            temp.append(s)
            if array.index(of: s) != array.count - 1 {
                temp.append(",")
            }
        }
        return temp
    }
    
    static func Init() {
        ref = Database.database().reference()
        
        let resultb = Building.initTable()
        //let resultc = Classroom.initTable()
        if !resultb {
            NSLog("Init failed")
        }
    }
    
    static func getFreeClassrooms(StartTime: Int, EndTime: Int, Day: String) {
        var result = [Classroom]()
        
        var query = ""
        while StartTime < EndTime {
            query += Day + String.init(StartTime) + "='free'"
            StartTime += 10
            if StartTime % 100 == 60 {
                StartTime += 40
            }
            if StartTime != EndTime {
                query += " AND "
            }
        }
        let stmt = try db.prepare("SELECT * FROM Classrooms WHERE " + query)
        for row in stmt {
            var classroom = Classroom(row[0]!)
            var schedule = [String]()
            for (index, name) in stmt.columnNames.enumerated() {
                
            }
        }

    }
}
