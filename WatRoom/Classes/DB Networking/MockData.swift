//
//  MockData.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/18/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation

struct MockData {
    
    
//    static func generateBuildings() -> [Building] {
//        
//        let buildings = [Building(name: "Applied Health Sciences", abbreviation: "AHS",
//                                  location: "43.473603, -80.546290".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Mathematics and Computer", abbreviation: "MC",
//                                  location: "43.472040, -80.543886".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "J.R. Coutts Engineering Hall", abbreviation: "RCH",
//                                  location: "43.470283, -80.540781".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "William G. Davis Computer Research Centre", abbreviation: "DC",
//                                  location: "43.472834, -80.542113".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Engineering 2", abbreviation: "E2",
//                                  location: "43.470953, -80.540270".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Science Teaching Complex", abbreviation: "STC",
//                                  location: "43.470625, -80.543421".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Arts Lecture Hall", abbreviation: "AL",
//                                  location: "43.468874, -80.541930".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Quantum Nano Centre", abbreviation: "QNC",
//                                  location: "43.471194, -80.544017".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Centre for Environmental and Information Technology", abbreviation: "EIT",
//                                  location: "43.471665, -80.542073".coordinates, classrooms: generateClassrooms()),
//                         Building(name: "Mathematics 3", abbreviation: "M3",
//                                  location: "43.473241, -80.544097".coordinates, classrooms: generateClassrooms())]
//        
//        return buildings.sorted { $0.abbreviation < $1.abbreviation }
//    }
//    
//    
//    private static func generateClassrooms() -> [Classroom] {
//        var classrooms: [Classroom] = []
//        
//        let numberOfClassrooms = Int(arc4random_uniform(5) + 5)
//        
//        // Randomly generate room numbers
//        func generateRoomNumber() -> String {
//            func generateNumber(forIndex index: Int) -> String {
//                
//                switch index {
//                case 0:
//                    return String(arc4random_uniform(4))
//                case 1,2,3:
//                    return String(arc4random_uniform(5) + 1)
//                default:
//                    return ""
//                }
//            }
//            
//            var roomNumber = ""
//            
//            for i in 0...3 {
//                roomNumber += generateNumber(forIndex: i)
//            }
//            
//            return roomNumber
//        }
//        
//        // Randomly generate availability
//        func generateAvailability() -> [Day: [Bool]] {
//            var availability: [Day: [Bool]] = [:]
//            
//            func generateTimeChunks() -> [Bool] {
//                var timeChunks: [Bool] = []
//                
//                for _ in 0..<18 {
//                    
//                    let rand = Int(arc4random_uniform(2))
//                    
//                    for _ in 0..<5 {
//                        timeChunks.append(rand.bool)
//                    }
//                }
//                
//                return timeChunks
//            }
//            
//            for day in Day.weekdays {
//                availability[day] = generateTimeChunks()
//            }
//            
//            return availability
//        }
//        
//        for _ in 1...numberOfClassrooms {
//            classrooms.append(Classroom(room: generateRoomNumber(), availability: generateAvailability()))
//        }
//        
//        return classrooms.sorted{ $0.roomNumber < $1.roomNumber }
//    }
    
}
