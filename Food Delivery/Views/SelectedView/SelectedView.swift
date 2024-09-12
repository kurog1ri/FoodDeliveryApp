//
//  SelectedView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import SwiftUI

struct SelectedView: View {
    
    @EnvironmentObject var selected: SelectedModel
    //@State private var selects = MockData.selects
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(selected.items) { food in
                            ListView(food: food)
                        }
                        .onDelete(perform: selected.deleteItems)
                    }
                    .listStyle(.insetGrouped)
                    
                    Button {
                        print("choose")
                    } label: {
                        AddButton(title: "$\(selected.totalPrice, specifier: "%.2f") - Buy")
                    }
                    .padding(.bottom, 25)
                }
                if selected.items.isEmpty {
                    EmptyState(imageName: "emptySelected",
                               message: "You have no items.\nPlease select something 🥺")
                }
            }
        }
        .navigationTitle("🛍️ Selected 🛍️")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SelectedView()
}
