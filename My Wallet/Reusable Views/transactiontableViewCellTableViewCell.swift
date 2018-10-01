//
//  transactiontableViewCellTableViewCell.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 26/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class transactiontableViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var imageBackgroundView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureBorders() -> Void {
        self.mainView.layer.borderWidth = 0.5
        self.mainView.layer.borderColor = UIColor(hex: "F7D45B").cgColor
        self.mainView.layer.cornerRadius = 10
        self.mainView.layer.masksToBounds = true
        self.mainView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        self.imageBackgroundView.layer.cornerRadius = 10
        self.imageBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
}
