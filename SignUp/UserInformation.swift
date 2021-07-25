//
//  UserInformation.swift
//  SignUp
//
//  Created by BH on 2021/07/23.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
