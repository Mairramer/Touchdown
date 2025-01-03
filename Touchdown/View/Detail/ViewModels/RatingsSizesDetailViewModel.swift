//
//  Created by Mairramer Silva on 03/01/25.
//


import SwiftUI

class RatingsSizesDetailViewModel: ObservableObject {
    @Published var selectedRating: Int? = nil
    @Published var selectedSize: String? = nil
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]

    func selectRating(_ rating: Int) {
        selectedRating = rating
    }

    func selectSize(_ size: String) {
        selectedSize = size
    }

    func isSizeSelected(_ size: String) -> Bool {
        return selectedSize == size
    }

    func isRatingSelected(_ rating: Int) -> Bool {
        return selectedRating == rating
    }
}
