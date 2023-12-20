//
//  ProductGridItemView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI

struct ProductGridItem: View {
    let product: Product
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var cartViewModel: CartViewModel

    @StateObject private var imageLoader: ImageLoader

    init(product: Product, viewModel: MainViewModel, cartViewModel: CartViewModel) {
        self.product = product
        self.viewModel = viewModel
        self.cartViewModel = cartViewModel
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: URL(string: product.thumbnail)!))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .cornerRadius(8)
            } else {
                ProgressView()
                    .frame(height: 100)
            }

            Text(product.title)
                .font(.headline)

            Text(String(format: "$%.2f", product.price))
                .foregroundColor(.green)

            QuantityControlsView(product: product, cartViewModel: cartViewModel)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
