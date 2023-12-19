//
//  ContentView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        TabView {
            MainView(viewModel: MainViewModel())
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            CategoriesView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Categories")
                }

            PlaceholderView(title: "Third View")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Third")
                }

            PlaceholderView(title: "Fourth View")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Fourth")
                }
        }
    }
}


struct PlaceholderView: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            Image(systemName: "questionmark.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.gray)
        }
    }
}
