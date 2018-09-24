//
//  SignUpViewController.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 24/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField


class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let civilities = ["Mr", "Mrs"]
    
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var civilityTextField: JVFloatLabeledTextField!
    
    override func viewDidLoad() {
        
        alphaView.layer.cornerRadius = 15
        self.navigationController?.navigationBar.tintColor = UIColor.init(hex: "E35728")
        
        let civilityPicker = UIPickerView()
        civilityPicker.dataSource = self
        civilityPicker.delegate = self
        
        civilityTextField.inputView = civilityPicker
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return civilities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.civilities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.civilityTextField.text = self.civilities[row]
    }
    
}



extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
