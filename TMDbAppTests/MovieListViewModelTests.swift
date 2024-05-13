//
//  MovieListViewModelTests.swift
//  TMDbAppTests

import XCTest
import TMDbNetworkSDK
@testable import TMDbApp

class MovieListViewModelTests: XCTestCase {
    
    var viewModel: MovieListViewModel!
    
    override func setUpWithError() throws {
        viewModel = MovieListViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_initialState_movieListIsEmpty() {
        let viewModel = MovieListViewModel()
        XCTAssertTrue(viewModel.movieList.isEmpty)
    }
    
    func test_initialState_currentPageNumberIsZero() {
        let viewModel = MovieListViewModel()
        XCTAssertEqual(viewModel.currentPageNumber, 0)
    }
    
    func test_initialState_totalPagesHasDefaultLimit() {
        let viewModel = MovieListViewModel()
        XCTAssertEqual(viewModel.totalPages, 100)
    }
    
    // Test case to fetch movies of a specific type
    func testFetchMovies_Success() {
        // Given
        let expectation = self.expectation(description: "Movies are fetched successfully")
        
        // When
        viewModel.fetchMovies(ofType: .latest)
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(self.viewModel.movieList.isEmpty, "Movie list should not be empty after fetching")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Test case to fetch more movies after a specific movie
    func testFetchMoreMovies_Success() {
        // Given
        let expectation = self.expectation(description: "More movies are fetched successfully")
        let mockMovie = Movie(adult: true, backdrop_path: "", genre_ids: nil, id: nil, original_language: "", original_title: "", overview: "Test Overview", popularity: nil, poster_path: "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg", release_date: nil, title: "Test Movie", video: false, vote_average: nil, vote_count: nil)
        viewModel.movieList = [mockMovie]
        
        // When
        viewModel.fetchMoreMovies(after: mockMovie, ofType: .latest)
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.movieList.count > 1, "Movie list should contain more than one movie after fetching more movies")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
