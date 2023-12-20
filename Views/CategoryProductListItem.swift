//
//  CategoryProductListItem.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI

struct ProductListItem: View {
    var product: Product
    @ObservedObject var imageLoader: ImageLoader
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } else {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                
                
                Text(String(format: "Price: $%.2f", product.price))
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Button("+") {
                cartViewModel.addToCart(product: product)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            print("Product Loaded: \(product)")
        }
    }
}
