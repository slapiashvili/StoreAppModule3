//
//  CategoryModel.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


struct Category: Identifiable, Decodable {
    var id: String
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

struct CategoriesData: Decodable {
    let categories: [Category]
}
