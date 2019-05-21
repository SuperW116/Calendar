//
//  TimeSectionCell.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/21.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class TimeSectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var availableSpotLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
    }
    
    
}
