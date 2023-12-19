//
//  CategoryViewModel.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//


import Foundation
import SwiftUI


class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var selectedCategory: Category?
    @Published var showingAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var products: [Product] = []

    
    init() {
        fetchCategories()
    }
    
    func fetchCategories() {
        // Step 1: Define the URL for fetching data
        guard let url = URL(string: "https://dummyjson.com/products") else {
            return
        }
        
        // Step 2: Use URLSession to fetch data from the URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return
            }
            
            // Step 3: Decode JSON data into Products
            do {
                let decodedData = try JSONDecoder().decode(ProductData.self, from: data)
                
                // Step 4: Extract unique categories from products
                let uniqueCategories = Set(decodedData.products.map { $0.category })
                
                // Step 5: Create Category objects
                let categories = uniqueCategories.map { Category(id: UUID().uuidString, name: $0) }
                
                // Step 6: Update categories on the main thread
                DispatchQueue.main.async {
                    self.categories = categories
                    print("Categories loaded successfully: \(self.categories)")
                }
            } catch {
                // Step 7: Handle any decoding errors
                print("Error decoding categories data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func fetchProducts(for category: Category) {
            // Step 1: Define the URL for fetching data
            guard let url = URL(string: "https://dummyjson.com/products") else {
                return
            }

            // Step 2: Use URLSession to fetch data from the URL
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("No data received.")
                    return
                }

                // Step 3: Decode JSON data into Products
                do {
                    let decodedData = try JSONDecoder().decode(ProductData.self, from: data)

                    // Step 4: Filter products based on the selected category
                    let categoryProducts = decodedData.products.filter { $0.category == category.name }

                    // Step 5: Update products on the main thread
                    DispatchQueue.main.async {
                        self.products = categoryProducts
                        print("Products loaded successfully for category \(category.name): \(self.products)")
                    }
                } catch {
                    // Step 6: Handle any decoding errors
                    print("Error decoding products data: \(error.localizedDescription)")
                }
            }.resume()
        }
    
        
        func showAlert(title: String, message: String) {
            self.alertTitle = title
            self.alertMessage = message
            self.showingAlert = true
        }
    
}
