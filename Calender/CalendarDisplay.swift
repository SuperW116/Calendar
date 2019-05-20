//
//  CalendarDisplay.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/20.
//  Copyright © 2019 LPB. All rights reserved.
//

import Foundation

struct CalendarDisplay {
    
    private let date: Date
    private let dateComponents: DateComponents
    
    init(date: Date) {
        self.date = date
        self.dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: date)
    }
    
    var weekday: String {
        guard let weekday = dateComponents.weekday else {
            return ""
        }
        switch weekday {
        case 1:
            return "日"
        case 2:
            return "一"
        case 3:
            return "二"
        case 4:
            return "三"
        case 5:
            return "四"
        case 6:
            return "五"
        case 7:
            return "六"
        default:
            return ""
        }
    }
    
    var day: String {
        if let day = dateComponents.day {
            return String(day)
        } else {
            return ""
        }
    }
    
    var month: String {
        if let month = dateComponents.month {
            return String(month)
        } else {
            return ""
        }
    }
    
    var monthAndDay: String {
        return "\(month):\(day)"
    }
    
    var isDayBeforeToday: Bool {
        guard let day = dateComponents.day, let currentDay = Calendar.current.dateComponents(in: TimeZone.current, from: Date()).day else {
            return false
        }
        return date < Date() && day < currentDay
    }
}
