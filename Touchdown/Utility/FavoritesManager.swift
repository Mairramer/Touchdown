//
//  Created by Mairramer Silva on 02/01/25.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favorites: Set<Int> = []

    func toggleFavorite(for productId: Int) {
        if favorites.contains(productId) {
            favorites.remove(productId)
        } else {
            favorites.insert(productId)
        }
    }

    func isFavorite(productId: Int) -> Bool {
        favorites.contains(productId)
    }
}
