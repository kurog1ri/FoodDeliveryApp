//
//  LoadingView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 27.07.2024.
//

import SwiftUI

struct LoadingIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let loadingIndicatorView = UIActivityIndicatorView(style: .large)
        loadingIndicatorView.color = UIColor.myColor
        loadingIndicatorView.startAnimating()
        return loadingIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            LoadingIndicator()
        }
    }
}
