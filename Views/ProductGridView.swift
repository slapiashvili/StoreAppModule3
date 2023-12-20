//
//  ProductGridView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct ProductsGridView: View {
    let products: [Product]
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var categoryViewModel: CategoryViewModel


    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                ForEach(products, id: \.id) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductGridItem(product: product, viewModel: viewModel, cartViewModel: cartViewModel)
                    }
                }
            }
            .padding()
        }
    }
}





