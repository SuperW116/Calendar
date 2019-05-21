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
    
    var selectedDate = Date() {
        didSet {
            let manager = TimeSectionDisplayManager()
            timeSectionsGroup = manager.timeSectionsGroup(by: selectedDate)
            collectionView.reloadData()
        }
    }
    var timeSectionsGroup = [[TimeSection]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submit(_ sender: UIButton) {
        print("submit(_ sender: UIButton)")
    }
    
}

extension TimeSectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return timeSectionsGroup.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Last section
        if section == timeSectionsGroup.count {
            return 1
        }
        return timeSectionsGroup[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        if indexPath.section == timeSectionsGroup.count {
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
        if section == timeSectionsGroup.count {
            return UIEdgeInsets(top: 30, left: 20, bottom: 15, right: 20)
        } else {
            return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == timeSectionsGroup.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeSectionButtonCell.shortName, for: indexPath) as! TimeSectionButtonCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeSectionCell.shortName, for: indexPath) as! TimeSectionCell
            let tSection = timeSectionsGroup[indexPath.section][indexPath.row]
            cell.configure(tSection: tSection)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section < timeSectionsGroup.count else {
            return
        }
        let tSection = timeSectionsGroup[indexPath.section][indexPath.row]
        guard tSection.isSelectable else {
            return
        }
        timeSectionsGroup[indexPath.section][indexPath.row].isSelected = !tSection.isSelected
        collectionView.reloadData()
    }
}
