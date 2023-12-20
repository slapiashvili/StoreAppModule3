//
//  cartView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel

    private var headerView: some View {
        Text("Cart")
            .font(.title)
            .bold()
    }

    private var cartItemsListView: some View {
        List {
            ForEach(cartViewModel.addedProducts) { product in
                CartItemView(product: product, quantity: cartViewModel.cartQuantity(for: product.title), cartViewModel: cartViewModel)
            }
        }
    }

    private var checkoutView: some View {
        HStack {
            Button(action: {
                // TODO: Add logic for checkout in the future
            }) {
                Text("Checkout")
                    .font(.headline)
                    .foregroundColor(.black)
            }

            Spacer()

            VStack {
                Text("Total: $\(String(format: "%.2f", cartViewModel.totalCartPrice()))")
                    .font(.headline)

                Text("Balance: $\(String(format: "%.2f", cartViewModel.currentBalance()))")
                    .font(.subheadline)
            }
        }
        .padding()
    }

    var body: some View {
        VStack {
            headerView
            cartItemsListView
            checkoutView
        }
    }
}


