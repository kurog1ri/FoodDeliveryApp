//
//  FoodModel.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import Foundation

struct FoodModel : Codable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct FoodResponse: Codable {
    let request: [FoodModel]
}

struct MockData {
    static let exampleFoodData = FoodModel(id: 1,
                                          name: "Test Name",
                                          description: "It`s for test only",
                                          price: 70,
                                          imageURL: "",
                                          calories: 20,
                                          protein: 9,
                                          carbs: 10)
    
    static let foods = [exampleFoodData, exampleFoodData, exampleFoodData]
    
    static let selectedItemOne = FoodModel(id: 1,
                                          name: "Test Name One",
                                          description: "It`s for test only",
                                          price: 70,
                                          imageURL: "",
                                          calories: 20,
                                          protein: 9,
                                          carbs: 10)
    
    static let selectedItemTwo = FoodModel(id: 2,
                                          name: "Test Name Two",
                                          description: "It`s for test only",
                                          price: 70,
                                          imageURL: "",
                                          calories: 20,
                                          protein: 9,
                                          carbs: 10)
    
    static let selectedItemThree = FoodModel(id: 3,
                                          name: "Test Name Three",
                                          description: "It`s for test only",
                                          price: 70,
                                          imageURL: "",
                                          calories: 20,
                                          protein: 9,
                                          carbs: 10)
    static let selects = [selectedItemOne, selectedItemTwo, selectedItemThree]
}

