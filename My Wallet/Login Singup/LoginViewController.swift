//
//  ViewController.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 21/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit
import IQKeyboardManager

class LoginViewController: UIViewController {
    

    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var bottomAlphaView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        alphaView.layer.cornerRadius = 15.0
        bottomAlphaView.clipsToBounds = true
        bottomAlphaView.layer.cornerRadius = 15.0
        bottomAlphaView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        loginButton.layer.cornerRadius = 10.0
        signUpButton.layer.cornerRadius = 10.0


    }

    @IBAction func didClickLogin(_ sender: Any) {
        
    }
    
    @IBAction func didClickForgotPassword(_ sender: Any) {
    }
}

