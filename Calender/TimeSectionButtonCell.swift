//
//  TimeSectionButton.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/21.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class TimeSectionButtonCell: UICollectionViewCell {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confirmButton.layer.cornerRadius = 5
    }
}
