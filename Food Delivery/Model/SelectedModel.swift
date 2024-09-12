//
//  SelectedModel.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 22.08.2024.
//

import SwiftUI

final class SelectedModel: ObservableObject {
    
    @Published var items: [FoodModel] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
