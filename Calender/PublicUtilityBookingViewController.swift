//
//  PublicUtilityBookingViewController.swift
//  Calender
//
//  Created by 劉士維 on 2019/5/22.
//  Copyright © 2019 LPB. All rights reserved.
//

import UIKit

class PublicUtilityBookingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.layer.cornerRadius = 5
        }
    }
    
    var numberOfPeople = 1
    var selectedDate: Date?
    var selectedTimeSections: [TimeSection]?
    
    let dateForamter: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "YYYY/MM/DD"
        return formater
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submit(_ sender: UIButton) {
        print("submit")
    }
    
}

extension PublicUtilityBookingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 65
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PublicUtilityBookingOptionCell.shortName, for: indexPath) as! PublicUtilityBookingOptionCell
            switch indexPath.row {
            case 0:
                cell.configureAppearance(isCompleted: true)
                cell.selectionLabel.text = "\(numberOfPeople)"
                cell.titleLabel.text = "人數"
            case 1:
                if let date = selectedDate {
                    cell.selectionLabel.text = dateForamter.string(from: date)
                    cell.configureAppearance(isCompleted: true)
                } else {
                    cell.selectionLabel.text = "請選擇日期"
                    cell.configureAppearance(isCompleted: false)
                }
                cell.titleLabel.text = "日期"
            case 2:
                if let tSection = selectedTimeSections, !tSection.isEmpty {
                    cell.configureAppearance(isCompleted: true)
                    cell.selectionLabel.text = "\(tSection.first!.startTimeText)-\(tSection.last!.endTimeText)"
                } else {
                    cell.selectionLabel.text = "請選擇時段"
                    cell.configureAppearance(isCompleted: false)
                }
                cell.titleLabel.text = "選擇時段"
            default:
                break
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
