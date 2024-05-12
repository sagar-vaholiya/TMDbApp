//
//  MovieListView.swift
//  TMDbApp

import SwiftUI
import Combine

enum MovieType: String {
    case latest, popular
}

struct MovieListView: View {
    let movieType: MovieType
    @ObservedObject var viewModel = MovieListViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    var body: some View {
    
        if networkMonitor.isConnected {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.movieList, id: \.uniqueId) { item in
                            NavigationLink(destination: MovieDetailView(movie: item)) {
                                HStack {
                                    MovieView(movie: item, movieType: movieType, vm: self.viewModel)
                                }.frame(height: UIScreen.main.bounds.height / 6)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                            }
                        }
                    }
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarTitle(Text(movieType.rawValue.capitalized))
            }
            .onLoad{
                self.viewModel.fetchMovies(ofType: movieType)
            }
        } else {
            NetworkStatusView()
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieType: .latest)
    }
}
