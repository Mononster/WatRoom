//
//  ClassroomsListCell.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/18/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit


class ClassroomsListCell: UITableViewCell, StoryboardInstantiable {
    
    static var identifier = "ClassroomsListCell"
    
    @IBOutlet fileprivate weak var roomNumber: UILabel?
    @IBOutlet fileprivate(set) weak var time: UILabel?
    
    var classroom: Classroom? {
        didSet {
            reload()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reload()
    }
    
    private func reload() {
        guard let classroom = classroom else { return }

        roomNumber?.text = classroom.roomNumber
        
        let availability = timeAvailability()
        time?.text = availability.startTime + " - " + availability.endTime
    }
    
    private func timeAvailability() -> (startTime: String, endTime: String) {
        guard let timeFilter = ClassroomsManager.sharedInstance.timeFilter else {
            return timeAvailabilityFromCurrentTime()
        }
        
        let tenMinutes = 60 * 10
        
        let minIndex = 7 * 60 * 60 / tenMinutes
        let maxIndex = 22 * 60 * 60 / tenMinutes
        
        let day = ClassroomsManager.sharedInstance.dayFilter
        
        let startIndex = Int(timeFilter.start.timeIntervalSinceReferenceDate) / tenMinutes
        let endIndex = Int(timeFilter.end.timeIntervalSinceReferenceDate) / tenMinutes
        
        guard startIndex >= minIndex && endIndex <= maxIndex,
        let availability = classroom?.availability[day],
            availability.count == 90 else { return timeAvailabilityFromCurrentTime() }
        
        let rangeStart = startIndex - minIndex
        let rangeEnd = endIndex - minIndex - 1
        
        guard rangeStart >= 0 && rangeEnd < availability.count else { return timeAvailabilityFromCurrentTime() }
        
        var slots: [Int] = []
        
        for (index, available) in availability.enumerated() {
            guard index > rangeStart && index < rangeEnd && available == true else { continue }
            slots.append(index)
        }
        
        guard let firstSlot = slots.first, let lastSlot = slots.last else { return timeAvailabilityFromCurrentTime() }
        
        let startingTimeInterval: TimeInterval = Double(7 * 60 * 60) + Double(firstSlot * 10 * 60)
        let endingTimeInterval: TimeInterval = Double(7 * 60 * 60) + Double(lastSlot * 10 * 60)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm a"
        
        let startDate = Date(timeIntervalSinceReferenceDate: startingTimeInterval)
        let endDate = Date(timeIntervalSinceReferenceDate: endingTimeInterval)
        
        return (dateFormatter.string(from: startDate), dateFormatter.string(from: endDate))
    }
    
    private func timeAvailabilityFromCurrentTime() -> (startTime: String, endTime: String) {
        let day = ClassroomsManager.sharedInstance.dayFilter
        guard let availability = classroom?.availability[day] else { return ("","") }
        
        let sevenHours = 7 * 60 * 60
        let tenMinutes = 60 * 10
        
        var slots: [Int] = []
        
        for (index, available) in availability.enumerated() {
            guard available == true else { break }
            slots.append(index)
        }
        
        guard let firstSlot = slots.first, let lastSlot = slots.last else { return ("","") }
        
        let startingTimeInterval: TimeInterval = Double(sevenHours) + Double(firstSlot * tenMinutes)
        let endingTimeInterval: TimeInterval = Double(sevenHours) + Double(lastSlot * tenMinutes)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm a"
        
        let startDate = Date(timeIntervalSinceReferenceDate: startingTimeInterval)
        let endDate = Date(timeIntervalSinceReferenceDate: endingTimeInterval)
        
        return (dateFormatter.string(from: startDate), dateFormatter.string(from: endDate))
    }
}
