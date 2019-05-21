//
//  TimeSection.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/21.
//  Copyright © 2019 LPB. All rights reserved.
//

import Foundation

struct TimeSection {
    
    let startDate: Date
    let availablePeople: Int
    let maxPeople: Int
    
    let endDate: Date
    let sDateComponents: DateComponents
    let eDateComponents: DateComponents
    
    var isSelected = false
    var numberOfPeopleToBeBooked = 1
    
    init(startDate: Date, availablePeople: Int, maxPeople: Int) {
        self.startDate = startDate
        self.availablePeople = availablePeople
        self.maxPeople = maxPeople
        
        endDate = startDate.addingTimeInterval(30 * 60)
        sDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: startDate)
        eDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: endDate)
    }
    
    var rangeText: String {
        guard let sHour = sDateComponents.hour, let sMinute = sDateComponents.minute, let eHour = eDateComponents.hour, let eMinute = eDateComponents.minute else {
            return ""
        }
        let sMinuteStr = sMinute > 10 ? String(sMinute) : "0\(sMinute)"
        let eMinuteStr = eMinute > 10 ? String(eMinute) : "0\(eMinute)"
        return "\(sHour):\(sMinuteStr)-\(eHour):\(eMinuteStr)"
    }
    
    var isSelectable: Bool {
        return availablePeople >= numberOfPeopleToBeBooked && Date() < endDate
    }
}
