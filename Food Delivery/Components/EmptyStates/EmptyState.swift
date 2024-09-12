//
//  EmtyState.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 01.08.2024.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 320)
                    
                Text(message)
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.myColor)
                    .padding()
            }
            .offset(y: -45)
        }
    }
}

#Preview {
    EmptyState(imageName: "emptySelected", message: "it`s a very loooooooooooooonggggg message for test!")
}
