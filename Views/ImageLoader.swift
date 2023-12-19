//
//  ImageLoader.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    init(url: URL) {
        load(url: url)
    }

    func load(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}
