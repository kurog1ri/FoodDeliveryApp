//
//  ErrorAlert.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 24.07.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContent {
    //MARK: network alerts
    static let invalidData       = AlertItem(title: Text("Server Error!"),
                                       message: Text("The data received from the server was invalid 🙁. Please contact support 🙌."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse   = AlertItem(title: Text("Server Error!"),
                                       message: Text("404 Error 🙁. Please try again later or contact support 🙌."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL        = AlertItem(title: Text("Server Error!"),
                                       message: Text("There was an issue connecting to the sever 🙁. If the this    persits, please contact support 🙌."),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete  = AlertItem(title: Text("Server Error!"),
                                       message: Text("Unable to comlete your request this time 🙁. Please check your internet connection 🙌."),
                                       dismissButton: .default(Text("OK")))
    
    
    //MARK: account alerts
    static let invalidForm  = AlertItem(title: Text("Invalid Form!"),
                                       message: Text("Fill all fields, please 😉."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail  = AlertItem(title: Text("Invalid Email!"),
                                       message: Text("Write valid email, please 😉."),
                                       dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess  = AlertItem(title: Text("Your Profile Saved!"),
                                       message: Text("Information was successfully saved 🥳, thank you 🫡."),
                                       dismissButton: .default(Text("OK")))
    
    static let InvalidSave  = AlertItem(title: Text("Profile Error!"),
                                       message: Text("Invalid profile 🤕, try again!."),
                                       dismissButton: .default(Text("OK")))
}
