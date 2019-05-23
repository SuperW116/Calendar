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
    
    func configure(tSection: TimeSection, hasEnoughSlots: Bool, isSelected: Bool) {
        
        timeLabel.text = tSection.rangeText
        availableSpotLabel.text = "\(tSection.availablePeople)/\(tSection.maxPeople)"
        availableSpotLabel.isHidden = tSection.availablePeople == -1
        
        if !tSection.isSelectable || !hasEnoughSlots {
            containerView.backgroundColor = .white
            timeLabel.textColor = UIColor(hex: "d0d0d0")
            availableSpotLabel.textColor = UIColor(hex: "d0d0d0")
            return
        }
        
        if isSelected {
            containerView.backgroundColor = UIColor(hex: "3eb0ca")
            timeLabel.textColor = .white
            availableSpotLabel.textColor = .white
        } else {
            containerView.backgroundColor = .white
            timeLabel.textColor = UIColor(hex: "383838")
            availableSpotLabel.textColor = UIColor(hex: "9d9d9d")
        }
    }
    
}
