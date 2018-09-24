//
//  ViewController.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 21/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit
import IQKeyboardManager
import JVFloatLabeledTextField
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    

    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var bottomAlphaView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginTextField: JVFloatLabeledTextField!
    @IBOutlet weak var passwordTextField: JVFloatLabeledTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false

        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
        alphaView.layer.cornerRadius = 15.0
        bottomAlphaView.clipsToBounds = true
        bottomAlphaView.layer.cornerRadius = 15.0
        bottomAlphaView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        loginButton.layer.cornerRadius = 10.0
        signUpButton.layer.cornerRadius = 10.0
        
        loginTextField.delegate = self
        passwordTextField.delegate = self

    }

    @IBAction func didClickLogin(_ sender: Any) {
        if checkLoginFields(){
            startSpinner()
            // serverAPI.loginWithCreditentials()
        } else {
            let alertController = UIAlertController(title: "Login Error", message:
                "Please check your creditentials !", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func didClickForgotPassword(_ sender: Any) {
    }
    
    func checkLoginFields() -> Bool{
         return loginTextField.text?.count == 2 && passwordTextField.text?.count == 2
      }
    
    func startSpinner(){
        IQKeyboardManager.shared().resignFirstResponder()
        
        let containerView = UIView(frame: self.view.frame)
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        let frame = CGRect(x: self.view.frame.maxX/2 - 45, y: self.view.frame.maxY/2 - 45, width: 90, height: 90)
        let spinnerView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType(rawValue: 22), color: UIColor.yellow, padding: 2.4)
        
        containerView.addSubview(spinnerView)
        containerView.centerXAnchor.constraint(equalToSystemSpacingAfter: containerView.centerXAnchor, multiplier: 1)
        containerView.centerYAnchor.constraint(equalToSystemSpacingBelow: containerView.centerYAnchor, multiplier: 1)

        self.view.addSubview(containerView)
        spinnerView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            spinnerView.stopAnimating()
            containerView.removeFromSuperview()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var finalBool: Bool
        if textField == loginTextField {
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            finalBool = newString.length <= maxLength
        }
        else{
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            finalBool = newString.length <= maxLength
        }
        return finalBool
    }
    
    
}
