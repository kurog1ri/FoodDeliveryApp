//
//  FoodDetailView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 29.07.2024.
//

import SwiftUI

struct FoodDetailView: View {
    
    @EnvironmentObject var selected: SelectedModel
    let food: FoodModel
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            FoodRemoteImage(urlString: food.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(food.name)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Text(food.description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.myColor)
                    .padding()
                
                HStack(spacing: 45) {
                    NutritionInfo(title: "Calories", value: "\(food.calories)")
                    NutritionInfo(title: "Carbs", value: "\(food.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(food.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                selected.items.append(food)
                isShowingDetailView = false
            } label: {
                AddButton(title: ("$\(food.price, specifier:"%.2f") - Add to Selected"))
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.darkGray))
        .cornerRadius(15)
        .shadow(radius: 70)
        .overlay(Button {
            isShowingDetailView = false
        } label: {
           DismissButton()
        },alignment: .topTrailing)
    }
}

#Preview {
    FoodDetailView(food: MockData.exampleFoodData, 
                   isShowingDetailView: .constant(true))
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 7) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
