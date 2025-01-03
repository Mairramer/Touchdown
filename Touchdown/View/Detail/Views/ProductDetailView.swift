//
//  Created by Mairramer Silva on 02/01/25.
//


import SwiftUI

struct ProductDetailView: View {
  // MARK: - PROPERTY
  
    @EnvironmentObject var shop: Shop
    @StateObject private var viewModel: ProductDetailViewModel
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    init(selectedProduct: Product, favoritesManager: FavoritesManager) {
            _viewModel = StateObject(wrappedValue: ProductDetailViewModel(selectedProduct: selectedProduct, favoritesManager: favoritesManager))
        }
  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5, content: {
      // NAVBAR
      NavigationBarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

      // HEADER
      HeaderDetailView()
        .padding(.horizontal)
      
      // DETAIL TOP PART
      TopPartDetailView()
        .padding(.horizontal)
        .zIndex(1)
      
      // DETAIL BOTTOM PART
      VStack(alignment: .center, spacing: 0, content: {
        // RATINGS + SIZES
        RatingsSizesDetailView()
          .padding(.top, -20)
          .padding(.bottom, 10)
        
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false, content: {
          Text(shop.selectedProduct?.description ?? sampleProduct.description)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        }) //: SCROLL
        
        // QUANTITY + FAVOURITE
          QuantityFavouriteDetailView(viewModel: viewModel)
          .padding(.vertical, 10)
        
        // ADD TO CART
          AddToCartDetailView(viewModel: viewModel)
          .padding(.bottom, 20)
      }) //: VSTACK
      .padding(.horizontal)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -105)
      )
    }) //: VSTACK
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      ).ignoresSafeArea(.all, edges: .all)
    )
  }
}

// MARK: - PREVIEW

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
      let favoritesManager = FavoritesManager()
      ProductDetailView(selectedProduct: products[0], favoritesManager: favoritesManager)
      .environmentObject(Shop())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
