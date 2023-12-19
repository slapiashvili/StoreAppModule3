//
//  ContentView.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @StateObject var cartViewModel = CartViewModel()
    @State private var isCartVisible = false

    var body: some View {
        NavigationView {
            VStack {
                ProductsGridView(products: viewModel.products, viewModel: viewModel, cartViewModel: cartViewModel)

                .padding()

                Button("Show Cart") {
                    isCartVisible.toggle()
                }
                .sheet(isPresented: $isCartVisible) {
                    CartView(cartViewModel: cartViewModel)
                }
            }
            .navigationTitle("Welcome back!")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}