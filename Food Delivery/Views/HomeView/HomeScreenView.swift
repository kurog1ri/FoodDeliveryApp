//
//  HomeScreenView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    @StateObject var viewModel = FoodViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.foods){ food in
                    ListView(food: food)
                        .listRowSeparatorTint(.myColor)
                        .onTapGesture {
                            viewModel.chooseFood = food
                            viewModel.isShowingDetailView = true
                        }
                }
                .navigationTitle("😋 Food Delivery 😋")
                .navigationBarTitleDisplayMode(.inline)
                .disabled(viewModel.isShowingDetailView)
            }
            
            .task {
                viewModel.getFoods()
            }
            
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isShowingDetailView {
                FoodDetailView(food: viewModel.chooseFood!, 
                               isShowingDetailView:
                                $viewModel.isShowingDetailView)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { AlertItem in
            Alert(title: AlertItem.title,
                  message: AlertItem.message,
                  dismissButton: AlertItem.dismissButton)
        }
    }
}

#Preview {
    HomeScreenView()
}
