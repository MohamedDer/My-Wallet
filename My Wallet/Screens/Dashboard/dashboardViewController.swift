//
//  dashboardViewController.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 25/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {

    
    @IBOutlet weak var ovalView: UIView!
    @IBOutlet weak var profileImageView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var balanceDetailsButton: UIButton!
    
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let gradient = CAGradientLayer()
        gradient.frame = ovalView.frame
        gradient.colors = [UIColor(hex: "F7D45B").cgColor,UIColor.orange.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = ovalView.frame.width/6
        gradient.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        ovalView.layer.insertSublayer(gradient, at: 0)
        ovalView.layer.cornerRadius = ovalView.frame.width/6
        ovalView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        

        
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        let attrString = NSMutableAttributedString(string: "Your balance is  ",attributes: [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic neo", size: 20)!])
        attrString.append(NSMutableAttributedString(string: "300,65 $",attributes: [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic neo", size: 29)!]))
        balanceLabel.attributedText = attrString
        
        menuCollectionView.showsVerticalScrollIndicator = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cvc = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCVC", for: indexPath) as! iconCollectionViewCell
        cvc.configureContent(image: UIImage.init(named: "\(indexPath.row + 1)")!, title: "Service \(indexPath.row + 1)")
        return cvc
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    @IBAction func showBalanceDetails(_ sender: Any) {
    }
    
}
