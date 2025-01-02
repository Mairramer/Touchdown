//
//  Created by Mairramer Silva on 02/01/25.
//

import SwiftUI

@main
struct TouchdownApp: App {
    @StateObject private var shop = Shop()

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(shop: shop))
                .environmentObject(shop)
        }
    }
}
