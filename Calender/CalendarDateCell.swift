//
//  CalenderDateCell.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/20.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class CalendarDateCell: UICollectionViewCell {
    
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    
    @IBOutlet weak var dateView: UIView! {
        didSet {
            dateView.layer.cornerRadius = dateView.frame.width / 2
        }
    }
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(by date: Date, isSelected: Bool) {
        let calendarDisplay = CalendarDisplay(date: date)
        dayOfTheWeekLabel.text = calendarDisplay.weekday
        dateLabel.text = calendarDisplay.day
        if isSelected {
            dateView.backgroundColor = UIColor(hex: "3eb0ca")
            dateLabel.textColor = .white
        } else {
            dateView.backgroundColor = UIColor(hex: "ebebeb")
            dateLabel.textColor = UIColor(hex: "383838")
        }
        if calendarDisplay.isDayBeforeToday {
            dateLabel.textColor = UIColor(hex: "d0d0d0")
        }
    }
    
}

