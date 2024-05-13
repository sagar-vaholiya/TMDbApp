//
//  MovieDetailView.swift
//  TMDbApp

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        let viewModel = MovieViewModel(movieItem: movie)
        
        return ScrollView {
            VStack(alignment: .center, spacing: 10.0) {
                
                if let posterUrl = viewModel.posterUrl {
                    AsyncImage(
                        url: posterUrl,
                        placeholder: { Image("placeholder").resizable().scaleEffect(0.5) },
                        image: { Image(uiImage: $0).resizable() }
                    )
                    .aspectRatio(0.67, contentMode: .fit)
                } else {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(0.67, contentMode: .fit)
                        .scaleEffect(0.5)
                }
                
                HStack {
                    Text(Image(systemName: "star.fill")).foregroundColor(.yellow) + Text(viewModel.rating)
                    Text(viewModel.releaseDate)
                        .fontWeight(.regular)
                }
                
                VStack(alignment: .center, spacing: 5.0) {
                    Text(viewModel.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(viewModel.overview)
                        .fontWeight(.regular)
                }
                .padding(EdgeInsets(top: 10,leading: 10, bottom: 10, trailing: 10))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
