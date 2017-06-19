//
//  ClassroomsListCell.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/18/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation


class ClassroomsListCell: UITableViewCell, StoryboardInstantiable {
    
    static var identifier = "ClassroomsListCell"
    
    @IBOutlet fileprivate weak var roomNumber: UILabel?
    @IBOutlet fileprivate weak var time: UILabel?
    
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
        
        guard let availability = filterAvailability() else { return }
        
        time?.text = availability.startTime + " - " + availability.endTime
    }
    
    private func filterAvailability() -> (startTime: String, endTime: String)? {
        let tenMinutes = 60 * 10
        
        let minIndex = 7 * 60 * 60 / tenMinutes
        let maxIndex = 22 * 60 * 60 / tenMinutes
        
        let day = ClassroomsManager.sharedInstance.dayFilter
        
        let startIndex = Int(ClassroomsManager.sharedInstance.timeFilter.start.timeIntervalSinceReferenceDate) / tenMinutes
        let endIndex = Int(ClassroomsManager.sharedInstance.timeFilter.end.timeIntervalSinceReferenceDate) / tenMinutes
        
        guard startIndex >= minIndex && endIndex <= maxIndex else { return nil }
        
        guard let availability = classroom?.availability[day], availability.count == 90 else { return nil }
        
        let rangeStart = startIndex - minIndex
        let rangeEnd = endIndex - minIndex - 1
        
        guard rangeStart >= 0 && rangeEnd < availability.count else { return nil }
        
        var slots: [Int] = []
        
        for (index, available) in availability.enumerated() {
            guard index >= rangeStart && index < rangeEnd && available != false else { continue }
            slots.append(index)
        }
        
        guard let firstSlot = slots.first, let lastSlot = slots.last else { return nil }
        
        let startingTimeInterval: TimeInterval = Double(7 * 60 * 60) + Double(firstSlot * 10 * 60)
        let endingTimeInterval: TimeInterval = Double(7 * 60 * 60) + Double(lastSlot * 10 * 60)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm a"
        
        let startDate = Date(timeIntervalSinceReferenceDate: startingTimeInterval)
        let endDate = Date(timeIntervalSinceReferenceDate: endingTimeInterval)
        
        return (dateFormatter.string(from: startDate), dateFormatter.string(from: endDate))
    }
}
