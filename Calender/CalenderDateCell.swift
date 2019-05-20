//
//  CalenderDateCell.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/20.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class CalenderDateCell: UICollectionViewCell {
    
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    
    @IBOutlet weak var dateView: UIView! {
        didSet {
            dateView.layer.cornerRadius = dateView.frame.width / 2
        }
    }
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
}
