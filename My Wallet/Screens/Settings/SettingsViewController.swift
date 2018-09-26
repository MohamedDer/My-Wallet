//
//  SettingsViewController.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 26/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var ovalView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        ovalView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        let gradient = CAGradientLayer()
        gradient.frame = ovalView.frame
        gradient.colors = [UIColor(hex: "F7D45B").cgColor,UIColor.orange.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = ovalView.frame.width/6
        gradient.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        ovalView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        ovalView.layer.cornerRadius = ovalView.frame.width/6
        ovalView.layer.insertSublayer(gradient, at: 0)

        
        
        
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        
        
        
    }
    


}
