//
//  CategoryViewModel.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//


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
        guard let url = URL(string: "https://dummyjson.com/products") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ProductData.self, from: data)
                
                let uniqueCategories = Set(decodedData.products.map { $0.category })
                
                let categories = uniqueCategories.map { Category(id: UUID().uuidString, name: $0) }
                
                DispatchQueue.main.async {
                    self.categories = categories
                    print("Categories loaded successfully: \(self.categories)")
                }
            } catch {
                print("Error decoding categories data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func fetchProducts(for category: Category) {
            guard let url = URL(string: "https://dummyjson.com/products") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("No data received.")
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode(ProductData.self, from: data)

                    let categoryProducts = decodedData.products.filter { $0.category == category.name }

                    DispatchQueue.main.async {
                        self.products = categoryProducts
                        print("Products loaded successfully for category \(category.name): \(self.products)")
                    }
                } catch {
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
