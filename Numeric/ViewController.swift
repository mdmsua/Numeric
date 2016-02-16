//
//  ViewController.swift
//  Numeric
//
//  Created by Dmytro Morozov on 15.02.16.
//  Copyright © 2016 Dmytro Morozov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    var picker : Picker? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker = Picker(4) { self.handleUpdate($0) }
        pickerView.dataSource = self.picker
        pickerView.delegate = self.picker
    }
    
    func handleUpdate(value : Double) {
        let formatter = NSNumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.numberStyle = .CurrencyStyle
        self.label.text = formatter.stringFromNumber(value)
    }
}

