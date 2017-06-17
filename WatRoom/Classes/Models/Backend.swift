//
//  Backend.swift
//  WatRoom
//
//  Created by a52zhang on 2017-06-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
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

func Init() {
    Building.initTable()
    Classroom.initTable()
}
