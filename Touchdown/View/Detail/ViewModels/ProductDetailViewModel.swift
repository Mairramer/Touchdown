//
//  Created by Mairramer Silva on 02/01/25.
//


import SwiftUI

class ProductDetailViewModel: ObservableObject {
    private var favoritesManager: FavoritesManager
    @Published var selectedProduct: Product
    @Published var productDescription: String
    @Published var counter: Int = 0

    init(selectedProduct: Product, favoritesManager: FavoritesManager? = nil) {
            self.selectedProduct = selectedProduct
            self.productDescription = selectedProduct.description
            self.favoritesManager = favoritesManager ?? FavoritesManager()
        }

    func increment() {
        if counter < 100 {
            feedback.impactOccurred()
            counter += 1
        }
    }

    func decrement() {
        if counter > 0 {
            feedback.impactOccurred()
            counter -= 1
        }
    }

    init(selectedProduct: Product, favoritesManager: FavoritesManager) {
        self.selectedProduct = selectedProduct
        self.productDescription = selectedProduct.description
        self.favoritesManager = favoritesManager
    }

    func toggleFavourite() {
        favoritesManager.toggleFavorite(for: selectedProduct.id)
    }

    func isFavorite() -> Bool {
        return favoritesManager.isFavorite(productId: selectedProduct.id)
    }

    func addToCart() {
        // Logic to add the product to the cart
    }
}
