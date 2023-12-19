//
//  CategoriesView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct CategoriesView: View {
    @ObservedObject var categoryViewModel: CategoryViewModel

    var body: some View {
        VStack {
            // Display list of categories
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    ForEach(categoryViewModel.categories) { category in
                        Button(action: {
                            categoryViewModel.selectedCategory = category
                            categoryViewModel.fetchProducts(for: category)
                        }) {
                            Text(category.name)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            // Fetch categories when the view appears
            categoryViewModel.fetchCategories()
        }
    }
}

