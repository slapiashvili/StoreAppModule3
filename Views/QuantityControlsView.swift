//
//  QuantityControlsView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI

struct QuantityControlsView: View {
    let product: Product
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        HStack {
            Button(action: {
                cartViewModel.removeFromCart(productName: product.title)
            }) {
                Image(systemName: "minus.circle")
                    .font(.headline)
                    .foregroundColor(.black)
            }

            Text("\(cartViewModel.cartQuantity(for: product.title))")
                .font(.headline)
                .foregroundColor(.white)
                .padding()

            Button(action: {
                cartViewModel.addToCart(product: product)
            }) {
                Image(systemName: "plus.circle")
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
}
