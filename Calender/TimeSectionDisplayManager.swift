//
//  TimeSectionDisplayManager.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/21.
//  Copyright © 2019 LPB. All rights reserved.
//

import Foundation

struct TimeSectionDisplayManager {
    
    let openingTimes: [Int]
    let availablePeopleSections: [Int]
    let maxPeople: Int
    
    init() {
        openingTimes = [0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0]
        availablePeopleSections = [0,0,4,7,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,1,0,0]
        maxPeople = 8
    }
    
    func timeSectionsGroup(by date: Date) -> [[TimeSection]] {
        var timeSections = [[TimeSection]]()
        let timeSectionsPerDay = generateTimeSectionsFor24HR(by: date)
        var prev = [TimeSection]()
        for (index, num) in openingTimes.enumerated() {
            if num == 0 && !prev.isEmpty {
                timeSections.append(prev)
                prev = []
            } else if num == 1 {
                prev.append(timeSectionsPerDay[index])
            }
        }
        return timeSections
    }
    
    private func generateTimeSectionsFor24HR(by date: Date) -> [TimeSection] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        return (0 ..< 48).map { (i) -> TimeSection in
            let d = startOfDay.addingTimeInterval(30 * 60 * Double(i))
            return TimeSection(startDate: d, availablePeople: availablePeopleSections[i], maxPeople: 8)
        }
    }
    
}
