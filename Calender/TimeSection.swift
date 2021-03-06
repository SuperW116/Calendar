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
    
    init(startDate: Date, availablePeople: Int, maxPeople: Int) {
        self.startDate = startDate
        self.availablePeople = availablePeople
        self.maxPeople = maxPeople
        
        endDate = startDate.addingTimeInterval(30 * 60)
        sDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: startDate)
        eDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: endDate)
    }
    
    var rangeText: String {
        return startTimeText + "-" + endTimeText
    }
    
    var startTimeText: String {
        guard let sHour = sDateComponents.hour, let sMinute = sDateComponents.minute else {
            return ""
        }
        let sMinuteStr = sMinute > 10 ? String(sMinute) : "0\(sMinute)"
        return "\(sHour):\(sMinuteStr)"
    }
    
    var endTimeText: String {
        guard let eHour = eDateComponents.hour, let eMinute = eDateComponents.minute else {
            return ""
        }
        let eMinuteStr = eMinute > 10 ? String(eMinute) : "0\(eMinute)"
        return "\(eHour):\(eMinuteStr)"
    }
    
    var isExpired: Bool {
        return Date() > endDate
    }
    
    var hasLimitNumberOfPeople: Bool {
        return availablePeople != -1
    }
}

extension TimeSection: Equatable {
    static func == (lhs: TimeSection, rhs: TimeSection) -> Bool {
        return lhs.startDate == rhs.startDate
    }
}
