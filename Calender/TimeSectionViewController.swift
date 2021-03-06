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
    
    var submissionHandler: (([TimeSection]) -> Void)?
    
    var selectedDate = Date() {
        didSet {
            let manager = TimeSectionDisplayManager()
            timeSectionsGroup = manager.timeSectionsGroup(by: selectedDate)
            if isViewLoaded {
                collectionView.reloadData()
            }
        }
    }
    var timeSectionsGroup = [[TimeSection]]()
    
    var selectedTimeSections = [TimeSection]()
    var minimumTimeSections = 1
    var numberOfPeopleToBeBooked = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func submit() {
        guard !selectedTimeSections.isEmpty else {
            return
        }
        submissionHandler?(selectedTimeSections)
    }
    
}

extension TimeSectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return timeSectionsGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeSectionsGroup[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: (screenWidth - 40 - 10) / 2, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeSectionCell.shortName, for: indexPath) as! TimeSectionCell
        let tSection = timeSectionsGroup[indexPath.section][indexPath.row]
        let hasEnoughSlots = numberOfPeopleToBeBooked <= tSection.availablePeople || !tSection.hasLimitNumberOfPeople
        cell.configure(tSection: tSection, hasEnoughSlots: hasEnoughSlots, isSelected: selectedTimeSections.contains(tSection))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row + minimumTimeSections > timeSectionsGroup[indexPath.section].count {
            return
        }
        
        var tSections = [TimeSection]()
        for row in indexPath.row ..< indexPath.row + minimumTimeSections {
            let tSection = timeSectionsGroup[indexPath.section][row]
            let hasEnoughSlots = numberOfPeopleToBeBooked <= tSection.availablePeople || !tSection.hasLimitNumberOfPeople
            if tSection.isExpired || !hasEnoughSlots {
                return
            }
            tSections.append(tSection)
        }
        selectedTimeSections = tSections
        collectionView.reloadData()
    }
}
