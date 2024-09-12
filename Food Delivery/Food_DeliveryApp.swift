//
//  Food_DeliveryApp.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import SwiftUI

@main
struct Food_DeliveryApp: App {
    var selected = SelectedModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(selected)
        }
    }
}
