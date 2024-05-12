//
//  MovieViewModel.swift
//  TMDbApp

import UIKit
import Foundation

class MovieViewModel: ObservableObject {
    
    private let movieItem: Movie
    
    init(movieItem: Movie) {
        self.movieItem = movieItem
    }
    
    var title: String {
        return movieItem.title ?? ""
    }
    
    var overview: String {
        return movieItem.overview ?? ""
    }
    
    var posterUrl: URL? {
        guard let posterPath = movieItem.poster_path else { return nil }
        let urlString = "https://image.tmdb.org/t/p/w500" + posterPath
        return URL(string: urlString)
    }
    
    var rating: String {
        guard let voteAverage = movieItem.vote_average else { return "TMDb Rating: N/A" }
        return String(format: "TMDb Rating: %.1f/10", voteAverage)
    }
    
    var releaseDate: String {
        return "Release date: \(movieItem.release_date ?? "N/A")"
    }
}
