//
//  MovieItem.swift
//  TMDbApp

import SwiftUI
import TMDbNetworkSDK

struct MovieView: View {
    
    var movie: Movie
    let movieType: MovieType
    @ObservedObject var vm: MovieListViewModel
    
    private let viewModel: MovieViewModel
    
    init(movie: Movie, movieType: MovieType, vm: MovieListViewModel) {
        self.movie = movie
        self.movieType = movieType
        self.vm = vm
        self.viewModel = MovieViewModel(movieItem: movie)
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10.0) {
            if let posterUrl = viewModel.posterUrl {
                AsyncImage(
                    url: posterUrl,
                    placeholder: { Image("placeholder").resizable() },
                    image: { Image(uiImage: $0).resizable() }
                )
                .scaledToFit()
                .cornerRadius(8.0)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            } else {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8.0)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text(viewModel.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(viewModel.rating)
                    .fontWeight(.semibold)
                Text(viewModel.releaseDate)
                    .fontWeight(.regular)
            }
            .onLoad {
                vm.fetchMoreMovies(after: movie, ofType: movieType)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
    }
}
