//
//  FoodViewModel.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import Foundation

@MainActor final class FoodViewModel: ObservableObject {
    
    @Published var foods: [FoodModel] = []
    @Published var alertItem: AlertItem?
    @Published var chooseFood: FoodModel?
    
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    
    func getFoods() {
        isLoading = true
        
        Task {
            do {
                foods = try await Networking.shared.getFoods()
                isLoading = false
            } catch {
                if let errors = error as? ErrorManager {
                    switch errors {
                    case .invalidData:
                        alertItem = AlertContent.invalidData
                    case .invalidURL:
                        alertItem = AlertContent.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContent.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContent.unableToComplete
                    }
                } else {
                    alertItem = AlertContent.invalidResponse
                }
                
                isLoading = false
            }
        }
    }
}
    
