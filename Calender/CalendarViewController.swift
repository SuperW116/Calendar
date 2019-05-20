//
//  ViewController.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/20.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedDate = Date()
    
    var sundayToSaturdayArray: [Date] {
//        guard let pivot = Calendar.current.dateComponents(in: TimeZone.current, from: selectedDate).weekday else {
//            return []
//        }
//        var dates = [Date]()
//        let dayInterval: Double = 24 * 60 * 60
//        if pivot > 1 {
//            for i in stride(from: pivot - 1, to: 0, by: -1) {
//                let date = selectedDate.addingTimeInterval(Double(-i) * dayInterval)
//                dates.append(date)
//            }
//        }
//        dates.append(selectedDate)
//        if pivot < 7 {
//            for i in pivot + 1 ... 7 {
//                let date = selectedDate.addingTimeInterval(Double(i - pivot) * dayInterval)
//                dates.append(date)
//            }
//        }
//        return dates
        var dates = [Date]()
        for i in 0 ..< 4 {
            let date = selectedDate.addingTimeInterval(Double(i) * 7 * 24 * 60 * 60)
            dates.append(contentsOf: generateOneWeek(by: date))
        }
        return dates
    }
    
    var calendarDisplay: CalendarDisplay {
        return CalendarDisplay(date: selectedDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .orange
    }
    
    func generateOneWeek(by date: Date) -> [Date] {
        guard let pivot = Calendar.current.dateComponents(in: TimeZone.current, from: date).weekday else {
            return []
        }
        var dates = [Date]()
        let dayInterval: Double = 24 * 60 * 60
        if pivot > 1 {
            for i in stride(from: pivot - 1, to: 0, by: -1) {
                let date = date.addingTimeInterval(Double(-i) * dayInterval)
                dates.append(date)
            }
        }
        dates.append(date)
        if pivot < 7 {
            for i in pivot + 1 ... 7 {
                let date = date.addingTimeInterval(Double(i - pivot) * dayInterval)
                dates.append(date)
            }
        }
        return dates
    }

    
}

extension CalendarViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sundayToSaturdayArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderDateCell", for: indexPath) as! CalendarDateCell
        let date = sundayToSaturdayArray[indexPath.row]
        cell.configure(by: date, isSelected: date == selectedDate)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 82)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        // (screenWidth - horizontal padding - total item width) / 6
        return (screenWidth - 30 - 45 * 7) / 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
    }
    
}
