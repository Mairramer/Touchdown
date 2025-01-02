//
//  Created by Mairramer Silva on 02/01/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @StateObject private var favoritesManager = FavoritesManager()

    var body: some View {
        ZStack {
            if !viewModel.showingProduct {
                mainContent
            } else {
                ProductDetailView(selectedProduct: viewModel.selectedProduct!,favoritesManager: favoritesManager)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    private var mainContent: some View {
        VStack(spacing: 0) {
            NavigationBarView()
                .padding(.horizontal, 15)
                .padding(.bottom)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    FeaturedTabView()
                        .frame(height: UIScreen.main.bounds.width / 1.475)
                        .padding(.vertical, 20)
                    
                    CategoryGridView()
                    
                    TitleView(title: "Helmets")
                    
                    LazyVGrid(columns: gridLayout, spacing: 15) {
                        ForEach(products) { product in
                            ProductItemView(product: product)
                                .onTapGesture {
                                    viewModel.selectProduct(product)
                                }
                        }
                    }
                    .padding(15)
                    
                    TitleView(title: "Brands")
                    
                    BrandGridView()
                    
                    FooterView()
                        .padding(.horizontal)
                }
            }
        }
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let shop = Shop()
        let homeViewModel = HomeViewModel(shop: shop)

        return HomeView(viewModel: homeViewModel)
            .previewDevice("iPhone 13")
            .environmentObject(shop)
    }
}
