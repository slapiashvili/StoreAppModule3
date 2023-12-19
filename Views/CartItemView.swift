//
//  CartItemView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct CartItemView: View {
    let product: Product
    let quantity: Int
    @ObservedObject var cartViewModel: CartViewModel 

    private var productImageView: some View {
        Image(product.thumbnail)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 40)
    }

    private var productDetailsView: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.headline)

            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
        }
    }

    private var quantityView: some View {
        Text("Quantity: \(quantity)")
    }

    private var removeButton: some View {
        Button(action: {
            cartViewModel.removeFromCart(productName: product.title)
        }) {
            Image(systemName: "trash")
                .foregroundColor(.red)
        }
    }

    var body: some View {
        HStack {
            productImageView
            productDetailsView
            Spacer()
            quantityView
            removeButton
        }
    }
}
