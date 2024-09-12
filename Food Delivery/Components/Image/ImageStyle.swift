//
//  ImageStyle.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 12.09.2024.
//

import SwiftUI

struct ImageStyle: View {
    
    let styleImage: String
    
    var body: some View {
        AsyncImage(url: URL(string: styleImage)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 95)
                .cornerRadius(15)
        }placeholder: {
            Image("questionMark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 95)
                .cornerRadius(15)
        }
    }
}

#Preview {
    ImageStyle(styleImage: "questionMark")
}
