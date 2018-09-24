//
//  User.swift
//  My Wallet
//
//  Created by Mohamed Derkaoui on 24/09/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation


class User {
    
    private let civility: civility
    private var firstName: String
    private var lastName: String
    private var email: String
    private var phoneNumber: String
    private var accountLimit: accountLimit
    
    init(civility: civility, firstName: String?, lastName: String?, email: String?, phoneNumber: String?, accountLimit: accountLimit) {
        self.civility = civility
        self.firstName = firstName ?? ""
        self.lastName = lastName ?? ""
        self.email = email ?? ""
        self.phoneNumber = phoneNumber ?? ""
        self.accountLimit = accountLimit
    }

    // TO DO : Set getters and setters
 
    // Validation
    func validate() -> [NSError] {
        var errors = [NSError]()
        if self.firstName.isEmpty {
            errors.append(NSError(domain: "UserValidation", code: 1, userInfo: ["field":"First Name"]))
        }
        if self.lastName.isEmpty {
            errors.append(NSError(domain: "UserValidation", code: 1, userInfo: ["field":"Last Name"]))
        }
        if self.phoneNumber.isEmpty {
            errors.append(NSError(domain: "UserValidation", code: 1, userInfo: ["field":"Phone Number"]))
        }
        if self.email.isEmpty {
            errors.append(NSError(domain: "UserValidation", code: 1, userInfo: ["field":"Email "]))
        } else {
            if !isValidEmail(email: self.email) {
                errors.append(NSError(domain: "UserValidation", code: 1, userInfo: ["field":"Email "]))
            }
        }
        
        return errors
    }
    
    
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}



enum accountLimit: Int {
    case min = 200
    case avg = 5000
    case max = 20000
}

enum civility: String {
    case mr = "Mr."
    case mrs = "Mrs."

}
