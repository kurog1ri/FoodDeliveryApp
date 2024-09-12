//
//  ListView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import SwiftUI

struct ListView: View {
    let food: FoodModel
    var body: some View {
        HStack {
            
            ImageStyle(styleImage: food.imageURL)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(food.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                Text("$\(food.price, specifier: "%.2f")")
                    .font(.title3)
                    .foregroundColor(.myColor)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ListView(food: MockData.exampleFoodData)
}
