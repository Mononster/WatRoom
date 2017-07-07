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
            let classroom = try db.prepare(classrooms.where(code == classroomCode))
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
}








