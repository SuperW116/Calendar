//
//  TimeSectionViewController.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/20.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

struct TimeSection {
    
    let startDate: Date
    let availablePeople: Int
    let maxPeople: Int
    let isAvailable: Bool
    
    let endDate: Date
    let sDateComponents: DateComponents
    let eDateComponents: DateComponents
    
    var isSelected = false
    
    init(startDate: Date, availablePeople: Int, maxPeople: Int, isAvailable: Bool) {
        self.startDate = startDate
        self.availablePeople = availablePeople
        self.maxPeople = maxPeople
        self.isAvailable = isAvailable
        
        endDate = startDate.addingTimeInterval(30 * 60)
        sDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: startDate)
        eDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: endDate)
    }
    
    var rangeText: String {
        guard let sHour = sDateComponents.hour, let sMinute = sDateComponents.minute, let eHour = eDateComponents.hour, let eMinute = eDateComponents.minute else {
            return ""
        }
        let sMinuteStr = sMinute > 10 ? String(sMinute) : "0\(sMinute)"
        let eMinuteStr = eMinute > 10 ? String(eMinute) : "0\(eMinute)"
        return "\(sHour):\(sMinuteStr)-\(eHour):\(eMinuteStr)"
    }
}

class TimeSectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedDate = Date() {
        didSet {
            
        }
    }
    //[0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0]
    var timeSections = [[TimeSection]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTimeSections(by: selectedDate)
    }
    
    func generateTimeSections(by date: Date) {
        let startOfDay = Calendar.current.startOfDay(for: selectedDate)
        let sections = (0 ..< 48).map { (i) -> TimeSection in
            let d = startOfDay.addingTimeInterval(30 * 60 * Double(i))
            return TimeSection(startDate: d, availablePeople: 3, maxPeople: 8, isAvailable: true)
        }
        timeSections.append(sections)
    }
    
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
        return timeSections[section].count
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
            let tSection = timeSections[indexPath.section][indexPath.row]
            cell.configure(tSection: tSection, isSelected: tSection.isSelected, isAvailable: tSection.availablePeople > 0)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        timeSections[indexPath.section][indexPath.row].isSelected = !timeSections[indexPath.section][indexPath.row].isSelected
        collectionView.reloadData()
    }
}
