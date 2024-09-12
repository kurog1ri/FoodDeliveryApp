//
//  Networking.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import UIKit

final class Networking {
    static let shared = Networking()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let endPointURL = baseURL + "appetizers"
    
    private init() {}
    
    func getFoods() async throws -> [FoodModel] {
        guard let url = URL(string: endPointURL) else {
            throw ErrorManager.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(FoodResponse.self, from: data).request
        } catch {
            throw ErrorManager.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string:urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

