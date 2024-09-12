//
//  AddButton.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 30.07.2024.
//

import SwiftUI

struct AddButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.light)
            .frame(width: 260, height: 50)
            .foregroundColor(.black)
            .background(Color.myColor)
            .cornerRadius(15)
            .shadow(radius: 15)
    }
}

#Preview {
    AddButton(title: "Button for test!")
}
