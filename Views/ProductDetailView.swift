//
//  ProductDetailView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct ProductDetailView: View {
    let product: Product

    var body: some View {
        Text(product.title)
            .font(.title)
            .padding()
    }
}


