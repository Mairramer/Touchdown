//
//  Created by Mairramer Silva on 02/01/25.
//


import SwiftUI

struct AddToCartDetailView: View {
  // MARK: - PROPERTY
    @StateObject var viewModel: ProductDetailViewModel
  
    // MARK: - BODY
        var body: some View {
            Button(action: {
                feedback.impactOccurred()
                viewModel.addToCart()
            }) {
                Spacer()
                Text("Add to cart".uppercased())
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .disabled(viewModel.counter == 0)
            .padding(15)
            .background(viewModel.counter == 0 ? Color.gray : viewModel.productColor)
            .clipShape(Capsule())
            .animation(.easeInOut, value: viewModel.counter)
        }
}

// MARK: - VIEW MODEL EXTENSION

extension ProductDetailViewModel {
    var productColor: Color {
        Color(
            red: selectedProduct.red,
            green: selectedProduct.green,
            blue: selectedProduct.blue
        )
    }
}

// MARK: - PREVIEW

struct AddToCartDetailView_Previews: PreviewProvider {
  static var previews: some View {
      let favoritesManager = FavoritesManager()
      let viewModel = ProductDetailViewModel(selectedProduct: sampleProduct, favoritesManager: favoritesManager)
      AddToCartDetailView(viewModel: viewModel)
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
