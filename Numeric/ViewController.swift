//
//  ViewController.swift
//  Numeric
//
//  Created by Dmytro Morozov on 15.02.16.
//  Copyright © 2016 Dmytro Morozov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    var segments = [0, 0, 0, 0];
    var decimals = [0, 0];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 7
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 4 ? 1 : 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 4 ? "," : String(row)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0...4:
            self.segments[component] = row
        case 5...7:
            self.decimals[6-component] = row
        default:
            break
        }
        let m = self.segments.enumerate().reduce(0, combine: { $0 + Double($1.1) * pow(10.0, Double(3-$1.0)) })
        let e = self.decimals.enumerate().reduce(0, combine: { $0 + Double($1.1) * pow(10.0, Double(-2+$1.0)) })
        let temp = m + e
        let formatter = NSNumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.numberStyle = .CurrencyStyle
        self.label.text = formatter.stringFromNumber(temp);
    }
    
}

