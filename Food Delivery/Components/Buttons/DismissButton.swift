//
//  DismissButton.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 30.07.2024.
//

import SwiftUI

struct DismissButton: View {
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(.myColor)
                .opacity(0.7)
            
            Image(systemName: "x.square.fill")
                .imageScale(.medium)
                .frame(width: 42, height: 42)
                .foregroundColor(Color(.darkGray))
        }
    }
}

#Preview {
    DismissButton()
}
