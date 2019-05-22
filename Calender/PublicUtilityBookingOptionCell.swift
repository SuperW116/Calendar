//
//  PublicUtilityBookingOptionCell.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/22.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class PublicUtilityBookingOptionCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    
    func configureAppearance(isCompleted: Bool) {
        selectionLabel.textColor = isCompleted ? UIColor(hex: "3eb0ca") : UIColor(hex: "d0d0d0")
    }
    
}
