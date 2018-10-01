//
//  LoginUseCase.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 28/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Alamofire



class LoginUseCase: LogingUseCaseProtocol {
    func loginWithCreditentials(phone: String, Password: String) -> Bool{
        return true
    }
    
    
}



protocol LogingUseCaseProtocol {
    func loginWithCreditentials(phone: String, Password: String) -> Bool
}
