//
//  ImageLoader.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 29.07.2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        
        Networking.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("questionMark").resizable()
    }
}

struct FoodRemoteImage: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {imageLoader.load(fromURLString: urlString)}
    }
}