//
//  Classroom.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import SQLite

final class Classroom : NSObject{
    
    let classroomCode : String
    //let schedule: [[Bool]]
    //var availability = true
    
    init(classroomCode: String) {
        self.classroomCode = classroomCode
//        do {
//            let db = try Connection("Library/Application support/db.sqlite3")
//            let classrooms = Table("Classrooms")
//            let classroom = try db.prepare(classrooms.where(classroomCode == ID))
//            if classroom.count > 0 {
//                self.schedule = CSVToArray(CSV: classroom[0][Expression<String>("schedule")])
//                self.availability = classroom[0][Expression<String>("availability")]
//            }
//            
//        } catch let error as NSError{
//            NSLog(error.description)
//        }
    }
    
    static func getLocalCopyByID(ID: String) -> Classroom? {
//        do {
//            let db = try Connection("Library/Application support/db.sqlite3")
//            let classrooms = Table("Classrooms")
//            let classroom = try db.prepare(classrooms.where(classroomsCode == ID))
//            if classroom.count > 0 {
//                let schedule = CSVToArray(CSV: classroom[0][Expression<String>("schedule")])
//                let availability = classroom[0][Expression<String>("availability")]
//                return Classroom(classroomCode: ID)
//            }
//            
//        } catch let error as NSError{
//            NSLog(error.description)
//        }
        return nil
    }
}








