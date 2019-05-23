//
//  ArrivedTimePickerView.swift
//  Com
//
//  Created by Luan on 2018/6/25.
//  Copyright © 2018年 Yowoo Technology Inc. All rights reserved.
//

import UIKit

class ArrivedTimePickerView: UIView {

    // MARK: - Properties
    var view: UIView!
    weak var delegate: ArrivedTimePickerViewDelegate?
    @IBOutlet weak var datePickerView: UIPickerView!
    @IBOutlet weak var timePickerView: UIPickerView!
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
        let nib = UINib(nibName: ArrivedTimePickerView.shortName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - Button
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        removeFromSuperview()
    }
    
    @IBAction func setArrivedTimeButtonPressed(_ asender: Any) {
        delegate?.didConfirmArrivalTime()
    }
}

protocol ArrivedTimePickerViewDelegate: class {
    func didConfirmArrivalTime()
}
