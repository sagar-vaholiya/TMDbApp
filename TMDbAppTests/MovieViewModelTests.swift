//
//  MovieViewModelTests.swift
//  TMDbAppTests

import XCTest
@testable import TMDbApp

class MovieViewModelTests: XCTestCase {
    
    // MARK: - Test Cases for title
    
    // Test case when title is available
    func testTitle_WithTitle() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "", popularity: nil, poster_path: "", release_date: "", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.title, "Test Movie")
    }
    
    // Test case when title is nil
    func testTitle_WithoutTitle() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "", popularity: nil, poster_path: "", release_date: "", title: nil, video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.title, "")
    }
    
    // MARK: - Test Cases for overview
    
    // Test case when overview is available
    func testOverview_WithOverview() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "", release_date: "", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.overview, "Test Overview")
    }
    
    // Test case when overview is nil
    func testOverview_WithoutOverview() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "", popularity: nil, poster_path: "", release_date: "", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.overview, "")
    }
    
    // MARK: - Test Cases for posterUrl
    
    // Test case when poster URL is available
    func testPosterUrl_WithUrl() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg", release_date: "", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertNotNil(viewModel.posterUrl)
    }
    
    // Test case when poster URL is nil
    func testPosterUrl_WithoutUrl() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: nil, release_date: "", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertNil(viewModel.posterUrl)
    }
    
    // MARK: - Test Cases for rating
    
    // Test case when vote average is available
    func testRating_WithVoteAverage() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg", release_date: "", title: "Test Movie", video: false, vote_average: 7.5, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.rating, "TMDb Rating: 7.5/10")
    }
    
    // Test case when vote average is nil
    func testRating_WithoutVoteAverage() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg", release_date: "", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.rating, "TMDb Rating: N/A")
    }
    
    // MARK: - Test Cases for releaseDate
    
    // Test case when release date is available
    func testReleaseDate_WithDate() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg", release_date: "2022-05-01", title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.releaseDate, "Release date: 2022-05-01")
    }
    
    // Test case when release date is nil
    func testReleaseDate_WithoutDate() {
        // Given
        let movieItem = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg", release_date: nil, title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        let viewModel = MovieViewModel(movieItem: movieItem)
        
        // Then
        XCTAssertEqual(viewModel.releaseDate, "Release date: N/A")
    }
}
