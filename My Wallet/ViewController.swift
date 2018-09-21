//
//  ViewController.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 21/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        alphaView.layer.cornerRadius = 15.0
        loginButton.layer.cornerRadius = 10.0


    }

    @IBAction func didClickLogin(_ sender: Any) {
    }
    
}

