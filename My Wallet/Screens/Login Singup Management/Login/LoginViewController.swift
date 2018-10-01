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
import RealmSwift

class LoginViewController: UIViewController {
    

    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var bottomAlphaView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginTextField: JVFloatLabeledTextField!
    @IBOutlet weak var passwordTextField: JVFloatLabeledTextField!
    var spview: SpinnerView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spview = SpinnerView(parentView: self.view)

//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.isNavigationBarHidden = true
        
        alphaView.layer.cornerRadius = 15.0
        bottomAlphaView.clipsToBounds = true
        bottomAlphaView.layer.cornerRadius = 15.0
        bottomAlphaView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        loginButton.layer.cornerRadius = 10.0
        signUpButton.layer.cornerRadius = 10.0
        
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
        loginTextField.delegate = self
        passwordTextField.delegate = self

    }

    @IBAction func didClickLogin(_ sender: Any) {
        /* TO DO :  There must be a login presenter - to handle spinner loader and make api call-, login UseCase -to manage the
         *network calls
         */
        spview?.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.spview?.stopAnimating()
            if self.checkLoginFields(){
                self.gotoDashboard()
            } else {
                let alertController = UIAlertController(title: "Login Error", message:
                    "Please check your creditentials !", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    /*
     *Check login should be in the presenter/use case and gotoDashboard in the router :)
     *I use 2 characters in login/password just to make it fast for me to test :}
     */
    
    func checkLoginFields() -> Bool{
        return loginTextField.text?.count == 2 && passwordTextField.text?.count == 2
    }
    
    func gotoDashboard() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.navigationController!.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func didClickForgotPassword(_ sender: Any) {
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
