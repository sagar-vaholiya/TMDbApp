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
    
    func fetchMovies(ofType type: MovieType) {
        apiClient.getMovies(type: type, page: currentPageNumber + 1) { [weak self] result in
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
    
    func fetchMoreMovies(after currentMovie: Movie, ofType movieType: MovieType) {
        guard let lastMovie = movieList.last else {
            fatalError("Unable to get the last movie.")
        }
        
        if currentMovie.id == lastMovie.id {
            apiClient.getMovies(type: movieType, page: currentPageNumber + 1) { [weak self] result in
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
    }
    
    private func updateMovieList(with movies: [Movie]) {
        movieList += movies
    }
    
    private func updatePaginationInfo(from response: MovieList) {
        totalPages = response.total_pages ?? 0
        currentPageNumber = response.page ?? 0
    }
}
