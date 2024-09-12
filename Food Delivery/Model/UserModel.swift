//
//  UserModel.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 30.07.2024.
//

import Foundation

struct UserModel: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDay = Date()
    var napkins = false
    var frequent = false
}
