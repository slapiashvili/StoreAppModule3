//
//  CategoriesView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CategoryDetailView(category: "Category 1")) {
                    Text("Category 1")
                }

                NavigationLink(destination: CategoryDetailView(category: "Category 2")) {
                    Text("Category 2")
                }

                NavigationLink(destination: CategoryDetailView(category: "Category 3")) {
                    Text("Category 3")
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoryDetailView: View {
    let category: String

    var body: some View {
        Text("Category: \(category)")
            .font(.title)
            .padding()
    }
}
