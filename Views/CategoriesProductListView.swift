//
//  CategoriesProductListView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct CategoryProductListView: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var selectedCategory: Category?

    @State private var isCartVisible = false

    var body: some View {
        VStack {
            // Display list of categories
            List(categoryViewModel.categories, id: \.id) { category in
                Button(action: {
                    selectedCategory = category
                    categoryViewModel.fetchProducts(for: category)
                }) {
                    Text(category.name)
                }
            }
            .listStyle(SidebarListStyle())
            .frame(width: 200)

            // Display products for the selected category
            if let selectedCategory = selectedCategory {
                List(categoryViewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductListItem(product: product, imageLoader: ImageLoader(url: URL(string: product.thumbnail)!), cartViewModel: cartViewModel)
                    }
                }
                .navigationTitle(selectedCategory.name)
            } else {
                Text("Please select a category")
                    .navigationTitle("Categories")
            }

            // Button to navigate to the cart view
            Button("Show Cart") {
                isCartVisible.toggle()
            }
            .sheet(isPresented: $isCartVisible) {
                CartView(cartViewModel: cartViewModel)
            }
            .padding()
        }
    }
}










