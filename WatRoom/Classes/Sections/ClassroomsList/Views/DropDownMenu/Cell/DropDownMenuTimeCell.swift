//
//  DropDownMenuTimeCell.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

class DropDownMenuTimeCell: UITableViewCell {

    @IBOutlet weak var slider: RangeCircularSlider!
    
    @IBOutlet weak var startingTime: UILabel!
    @IBOutlet weak var endingTime: UILabel!
    
    @IBAction func updateText(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.locale = Locale(identifier:"en_US_POSIX")
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        
        adjustValue(value: &slider.startPointValue)
        adjustValue(value: &slider.endPointValue)
        
        let start = TimeInterval(slider.startPointValue)
        let startDate = Date(timeIntervalSinceReferenceDate: start)
        startingTime.text = dateFormatter.string(from: startDate)
        
        let end = TimeInterval(slider.endPointValue)
        let endDate = Date(timeIntervalSinceReferenceDate: end)
        endingTime.text = dateFormatter.string(from: endDate)
        
        ClassroomsManager.sharedInstance.timeFilter = (startDate, endDate)
    }
    
    func adjustValue(value: inout CGFloat) {
        let minutes = value / 60
        let adjustedMinutes =  ceil(minutes / 5.0) * 5
        value = adjustedMinutes * 60
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupDateControl()
        configSlider()
    }
    
    func configSlider() {
        let dayInSeconds = 24 * 60 * 60
        slider.maximumValue = CGFloat(dayInSeconds)
        
        slider.startPointValue = 1 * 60 * 60
        slider.endPointValue = 8 * 60 * 60
        
        updateText(slider)
    }
    
    func setupDateControl() {
        
        var data = [String]()
        let currentWeekday = Date.getCurrentWeekday()
        
        var startAppending = false
        
        for weekday in iterateEnum(Weekday.self) {
            
            if weekday == currentWeekday {
                startAppending = true
            }
            
            if startAppending {
                data.append(weekday.rawValue)
            }
        }
        
        for weekday in iterateEnum(Weekday.self) {
            
            if weekday == currentWeekday {
                startAppending = false
            }
            
            if startAppending {
                data.append(weekday.rawValue)
            }
        }
        
        let dateControl = DateControl(titles: data,
                                      frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        dateControl.delegate = self
        self.addSubview(dateControl)
    }
}

extension DropDownMenuTimeCell: DateControlActionDelegate {
    
    func tappedMenu(page: Int) {
        ClassroomsManager.sharedInstance.dayFilter = Day.atIndex(page)
    }
}
