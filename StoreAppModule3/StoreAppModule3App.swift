//
//  StoreAppModule3App.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


@main
struct StoreAppModule3App: App {
    let mainViewModel = MainViewModel()
    let categoryViewModel = CategoryViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                MainView(viewModel: mainViewModel, categoryViewModel: categoryViewModel)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                CategoryProductListView(categoryViewModel: categoryViewModel, cartViewModel: CartViewModel(), selectedCategory: .constant(nil))
                    .tabItem {
                        Label("Categories", systemImage: "list.bullet")
                    }

            }
        }
    }
}




