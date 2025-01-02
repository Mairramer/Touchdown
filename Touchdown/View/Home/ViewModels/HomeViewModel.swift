//
//  Created by Mairramer Silva on 02/01/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var showingProduct: Bool
    @Published var selectedProduct: Product?

    private var shop: Shop

    init(shop: Shop) {
        self.shop = shop
        self.showingProduct = shop.showingProduct
        self.selectedProduct = shop.selectedProduct
    }

    func selectProduct(_ product: Product) {
        // Update both the shop and view model state
        shop.selectedProduct = product
        shop.showingProduct = true
        self.selectedProduct = product
        self.showingProduct = true
    }

    func clearSelection() {
        // Clear both the shop and view model state
        shop.selectedProduct = nil
        shop.showingProduct = false
        self.selectedProduct = nil
        self.showingProduct = false
    }
}
