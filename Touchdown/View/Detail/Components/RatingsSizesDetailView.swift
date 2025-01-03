//
//  Created by Mairramer Silva on 03/01/25.
//

import SwiftUI

struct RatingsSizesDetailView: View {
  // MARK: - PROPERTY
  @StateObject var viewModel = RatingsSizesDetailViewModel()

  // MARK: - BODY
  var body: some View {
    HStack(alignment: .top, spacing: 3) {
      // RATINGS
      VStack(alignment: .leading, spacing: 3) {
        Text("Ratings")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)

        HStack(alignment: .center, spacing: 3) {
          ForEach(1...5, id: \.self) { rating in
            Button(action: {
              viewModel.selectRating(rating)
            }) {
              Image(systemName: "star.fill")
                .frame(width: 28, height: 28, alignment: .center)
                .foregroundColor(
                  viewModel.selectedRating ?? 0 >= rating ? .yellow : colorGray
                )
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(
                      viewModel.selectedRating ?? 0 >= rating ? Color.yellow : colorGray,
                      lineWidth: 2)
                )
            }
          }
        }
      }

      Spacer()

      // SIZES
      VStack(alignment: .trailing, spacing: 3) {
        Text("Sizes")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)

        HStack(alignment: .center, spacing: 5) {
          ForEach(viewModel.sizes, id: \.self) { size in
            Button(action: {
              viewModel.selectSize(size)
            }) {
              Text(size)
                .font(.footnote)
                .fontWeight(.heavy)
                .foregroundColor(
                  viewModel.isSizeSelected(size) ? .white : colorGray
                )
                .frame(width: 28, height: 28, alignment: .center)
                .background(
                  viewModel.isSizeSelected(size)
                    ? Color.blue.cornerRadius(5) : Color.white.cornerRadius(5)
                )
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(
                      viewModel.isSizeSelected(size) ? Color.blue : colorGray,
                      lineWidth: 2)
                )
            }
          }
        }
      }
    }  //: HSTACK
  }
}

// MARK: - PREVIEW

struct RatingsSizesDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RatingsSizesDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
