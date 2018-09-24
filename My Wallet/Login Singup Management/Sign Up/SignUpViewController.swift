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
    var signupForm: SignUpForm?
    
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var civilityTextField: JVFloatLabeledTextField!
    @IBOutlet weak var firstNameTextField: JVFloatLabeledTextField!
    @IBOutlet weak var lastNameTextField: JVFloatLabeledTextField!
    @IBOutlet weak var phoneNumberTextField: JVFloatLabeledTextField!
    @IBOutlet weak var emailTextField: JVFloatLabeledTextField!
    @IBOutlet weak var accountLimitSegControl: UISegmentedControl!
    
    
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
    
    @IBAction func didClickDone(_ sender: Any) {
        let civ = civility.mr//civilityTextField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let phoneNumber = phoneNumberTextField.text
        let email = emailTextField.text
        let accountLim = accountLimit.min  //accountLimitSegControl.selectedSegmentIndex
        
        let newUser = User(civility: civ, firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, accountLimit: accountLim)
        if !newUser.validate().isEmpty{
            show(errors: newUser.validate())
        } else {
            // TO DO  : send datat to server and redirect to login page
            let errorAlert = UIAlertController(title: "Youhouu !", message: "You Signed Up Succefully ", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }
        
    }
    
    private func show(errors: [NSError]) {
        print(errors)
        
        let title = errors.count > 1 ? "Uh-oh.. Please take a look at the following fields" : "Uh-oh.. Please take a look at the following field"
        let fields = errors.compactMap {
            $0.userInfo["field"] as? String }
        let description = "  \(fields.joined(separator: ", "))"
        let errorAlert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)
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
