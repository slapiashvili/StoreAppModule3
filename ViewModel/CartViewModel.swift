//
//  CartViewModel.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


class CartViewModel: ObservableObject {
    @Published var cart: [String: Int] = [:]
    @Published var addedProducts: [Product] = []
    @Published var balance: Double = 50

    func cartQuantity(for productName: String) -> Int {
        cart[productName] ?? 0
    }

    func addToCart(product: Product) {
        let productName = product.title

        if let quantity = cart[productName], quantity < product.stock {
            cart[productName] = quantity + 1
            updateProductStock(productName: productName, quantity: 1)
            addedProducts.append(product)
            print("Added to cart: \(productName), Quantity: \(cart[productName] ?? 0)")
        } else {
            cart[productName] = 1
            updateProductStock(productName: productName, quantity: 1)
            addedProducts.append(product)
            print("Added to cart: \(productName), Quantity: \(cart[productName] ?? 0)")
        }
        print("Cart: \(cart)")
        print("Added Products: \(addedProducts)")
    }

    func removeFromCart(productName: String) {
        if let quantity = cart[productName], quantity > 0 {
            cart[productName] = quantity - 1
            updateProductStock(productName: productName, quantity: -1)

            if cart[productName] == 0 {
                cart.removeValue(forKey: productName)
                addedProducts.removeAll { $0.title == productName }
            }

            print("Removed from cart: \(productName), Quantity: \(cart[productName] ?? 0)")
        }
        print("Cart: \(cart)")
        print("Added Products: \(addedProducts)")
    }

    private func updateProductStock(productName: String, quantity: Int) {
        if let productIndex = addedProducts.firstIndex(where: { $0.title == productName }) {
            addedProducts[productIndex].stock += quantity
        }
    }

    func totalCartPrice() -> Double {
        var total = 0.0
        for (productName, quantity) in cart {
            if let product = addedProducts.first(where: { $0.title == productName }) {
                total += product.price * Double(quantity)
            }
        }
        return total
    }

    func currentBalance() -> Double {
        return balance
    }
}
