//
//  ViewModel.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var showingAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""


    func fetchProducts() {
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
                DispatchQueue.main.async {
                    self.products = decodedData.products
                    print("Products loaded successfully: \(self.products)")
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }


    func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showingAlert = true
    }
}



