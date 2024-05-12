//
//  MoviesViewModel.swift
//  TMDbApp

import UIKit
import TMDbNetworkSDK

class MovieListViewModel: ObservableObject {
    
    private let apiClient: APIClient
    @Published var movieList = [Movie]()
    var currentPageNumber: Int
    var totalPages: Int
    
    init() {
        self.apiClient = APIClient.shared
        currentPageNumber = 0
        totalPages = 100 // Default upper limit for total pages
    }
    
    /// Fetches movies of the specified type from the API.
    /// - Parameter type: The type of movies to fetch.
    func fetchMovies(ofType type: MovieType) {
        apiClient.getMovies(type: type) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                if let res = response {
                    DispatchQueue.main.async {
                        self.updateMovieList(with: res.results ?? [])
                        self.updatePaginationInfo(from: res)
                    }
                }
            case .failure(let error):
                print("Failed to fetch movies: \(error.localizedDescription)")
            }
        }
    }
    
    /// Fetches more movies of the same type.
    /// - Parameters:
    ///   - currentMovie: The current movie to compare with.
    ///   - movieType: The type of movies to fetch.
    func fetchMoreMovies(after currentMovie: Movie, ofType movieType: MovieType) {
        guard let lastMovie = movieList.last else {
            fatalError("Unable to get the last movie.")
        }
        
        if currentMovie.id == lastMovie.id {
            checkAndLoadMovies(ofType: movieType, nextPage: currentPageNumber + 1)
        }
    }
    
    /// Checks and loads movies of the specified type from the API.
    /// - Parameters:
    ///   - type: The type of movies to fetch.
    ///   - nextPage: The page number for the next set of movies.
    private func checkAndLoadMovies(ofType type: MovieType, nextPage: Int) {
        apiClient.getMovies(type: type, page: nextPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                if let res = response {
                    DispatchQueue.main.async {
                        self.updateMovieList(with: res.results ?? [])
                        self.updatePaginationInfo(from: res)
                    }
                }
            case .failure(let error):
                print("Failed to fetch more movies: \(error.localizedDescription)")
            }
        }
    }
    
    /// Updates the movie list with new movies.
    /// - Parameter movies: The new movies to add to the list.
    private func updateMovieList(with movies: [Movie]) {
        movieList += movies
    }
    
    /// Updates pagination information from the API response.
    /// - Parameter response: The API response containing pagination details.
    private func updatePaginationInfo(from response: MovieList) {
        totalPages = response.total_pages ?? 0
        currentPageNumber = response.page ?? 0
    }
}
