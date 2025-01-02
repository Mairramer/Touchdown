//
//  Created by Mairramer Silva on 02/01/25.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    @StateObject  var viewModel: ProductDetailViewModel

    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: {
                viewModel.decrement()
            }) {
                Image(systemName: "minus.circle")
            }

            Text("\(viewModel.counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)

            Button(action: {
                viewModel.increment()
            }) {
                Image(systemName: "plus.circle")
            }

            Spacer()

            Button(action: {
                viewModel.toggleFavourite()
            }) {
                Image(systemName: "heart.circle")
                    .foregroundColor(viewModel.isFavorite() ? .pink : .gray)
            }
        } //: HSTACK
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

// MARK: - PREVIEW
struct QuantityFavouriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample product and favorites manager for the preview
        let sampleProduct = Product(id: 1, name: "Sample Product", image: "sample", price: 100, description: "A great product", color: [1.0, 0.0, 0.0])
        let favoritesManager = FavoritesManager()
        let viewModel = ProductDetailViewModel(selectedProduct: sampleProduct, favoritesManager: favoritesManager)

        // Pass the viewModel to QuantityFavouriteDetailView
        QuantityFavouriteDetailView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

