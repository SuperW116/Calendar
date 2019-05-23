//
//  ArrivedTimePickerView.swift
//  Com
//
//  Created by Luan on 2018/6/25.
//  Copyright © 2018年 Yowoo Technology Inc. All rights reserved.
//

import UIKit

class LocalbondDatePickerView: UIView {

    // MARK: - Properties
    var view: UIView!
    weak var delegate: LocalbondDatePickerViewDelegate?
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    fileprivate func setup() {
        view = loadViewFromNib()
        frame = view.frame
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: LocalbondDatePickerView.shortName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - Button
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        removeFromSuperview()
    }
    
    @IBAction func setArrivedTimeButtonPressed(_ asender: Any) {
        delegate?.didConfirmDate(datePicker.date)
    }
}

protocol LocalbondDatePickerViewDelegate: class {
    func didConfirmDate(_ date: Date)
}
