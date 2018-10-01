//
//  SpinnerView.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 27/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import UIKit
import IQKeyboardManager
import NVActivityIndicatorView

class SpinnerView: UIView {

    private var spinnerView: NVActivityIndicatorView?
    private var parentView: UIView?
    private var containerView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(parentView : UIView) {
        super.init(frame: CGRect())

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: parentView.frame.width, height: parentView.frame.height))
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let frame = CGRect(x: parentView.frame.maxX/2 - 45, y: parentView.frame.maxY/2 - 45, width: 90, height: 90)
        self.spinnerView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType(rawValue: 22), color: UIColor.yellow, padding: 2.4)
        
        containerView.addSubview(spinnerView!)
        containerView.centerXAnchor.constraint(equalToSystemSpacingAfter: parentView.centerXAnchor, multiplier: 1)
        containerView.centerYAnchor.constraint(equalToSystemSpacingBelow: parentView.centerYAnchor, multiplier: 1)
        
        self.containerView = containerView
        self.parentView = parentView

    }
    
    func startAnimating() -> Void {
        IQKeyboardManager.shared().resignFirstResponder()
        
        self.parentView?.addSubview(self.containerView!)
        self.spinnerView?.startAnimating()
    }
    
    func stopAnimating() -> Void {
        self.spinnerView?.stopAnimating()
        self.containerView?.removeFromSuperview()
    }
    
    
}


