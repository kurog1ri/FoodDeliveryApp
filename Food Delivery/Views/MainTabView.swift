//
//  ContentView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var selected: SelectedModel
    
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem { Label("Home", systemImage: "house.circle") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person.circle") }
            
            SelectedView()
                .tabItem { Label("Selected", systemImage: "bag.circle") }
                .badge(selected.items.count)
        }
    }
}

#Preview {
    MainTabView()
}
