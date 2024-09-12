//
//  AccountViewModel.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 30.07.2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = UserModel()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContent.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContent.invalidEmail
            return false
        }
        return true
    }
    
    func save() {
        guard isValidForm else {return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContent.userSaveSuccess
        } catch {
            alertItem = AlertContent.InvalidSave
        }
    }
    
    func getUser() {
        guard let userData else {return}
        
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            alertItem = AlertContent.invalidData
        }
    }
}
