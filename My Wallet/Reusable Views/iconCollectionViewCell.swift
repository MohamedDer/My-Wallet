//
//  iconCollectionViewCell.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 25/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class iconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var iconLabel: UILabel!
    
    func configureContent(image: UIImage, title: String) {
        self.iconImageView.image = image
        self.iconLabel.text = title
        
    }
    
}
