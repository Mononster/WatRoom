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
    
}
