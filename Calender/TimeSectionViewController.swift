//
//  TimeSectionViewController.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/20.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class TimeSectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //[0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0]
    var timeSections = [1, 1, 1]
    
    @IBAction func submit(_ sender: UIButton) {
        print("submit(_ sender: UIButton)")
    }
    
}

extension TimeSectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return timeSections.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Last section
        if section == timeSections.count {
            return 1
        }
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        if indexPath.section == timeSections.count {
            return CGSize(width: screenWidth - 40, height: 44)
        } else {
            return CGSize(width: (screenWidth - 40 - 10) / 2, height: 65)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == timeSections.count {
            return UIEdgeInsets(top: 30, left: 20, bottom: 15, right: 20)
        } else {
            return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == timeSections.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeSectionButtonCell.shortName, for: indexPath) as! TimeSectionButtonCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeSectionCell.shortName, for: indexPath) as! TimeSectionCell
            cell.configure(isSelected: indexPath.row == 3, isAvailable: indexPath.row != 5)
            return cell
        }
    }
}
