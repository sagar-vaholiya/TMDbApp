//
//  ModelTests.swift
//  TMDbAppTests

import XCTest
@testable import TMDbApp

class MovieListTests: XCTestCase {
    
    func testMovieListModelReponse() throws {
        // Given
        let json = """
        {
          "page": 1,
          "results": [
            {
              "adult": false,
              "backdrop_path": "/fypydCipcWDKDTTCoPucBsdGYXW.jpg",
              "genre_ids": [
                878,
                12,
                28
              ],
              "id": 653346,
              "original_language": "en",
              "original_title": "Kingdom of the Planet of the Apes",
              "overview": "Several generations in the future following Caesar's reign, apes are now the dominant species and live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all that he has known about the past and to make choices that will define a future for apes and humans alike.",
              "popularity": 2758.182,
              "poster_path": "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
              "release_date": "2024-05-08",
              "title": "Kingdom of the Planet of the Apes",
              "video": false,
              "vote_average": 7.255,
              "vote_count": 186
            },
            {
              "adult": false,
              "backdrop_path": "/uv2twFGMk2qBdyJBJAVcrpRtSa9.jpg",
              "genre_ids": [
                10752,
                28,
                18
              ],
              "id": 929590,
              "original_language": "en",
              "original_title": "Civil War",
              "overview": "In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.",
              "popularity": 536.201,
              "poster_path": "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
              "release_date": "2024-04-10",
              "title": "Civil War",
              "video": false,
              "vote_average": 7.418,
              "vote_count": 633
            },
            {
              "adult": false,
              "backdrop_path": "/fUC5VsQcU3m6zmYMD96R7RqPuMn.jpg",
              "genre_ids": [
                28,
                80,
                53
              ],
              "id": 1105407,
              "original_language": "en",
              "original_title": "Damaged",
              "overview": "A Chicago detective travels to Scotland after an emerging serial killer’s crimes match those that he investigated five years earlier, one of which was the crime scene of his murdered girlfriend.",
              "popularity": 719.705,
              "poster_path": "/u3aPmYOkd8GclXg8nTvKQ4w1f7L.jpg",
              "release_date": "2024-04-12",
              "title": "Damaged",
              "video": false,
              "vote_average": 4.854,
              "vote_count": 79
            },
            {
              "adult": false,
              "backdrop_path": "/pwGmXVKUgKN13psUjlhC9zBcq1o.jpg",
              "genre_ids": [
                28,
                14
              ],
              "id": 634492,
              "original_language": "en",
              "original_title": "Madame Web",
              "overview": "Forced to confront revelations about her past, paramedic Cassandra Webb forges a relationship with three young women destined for powerful futures...if they can all survive a deadly present.",
              "popularity": 633.352,
              "poster_path": "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg",
              "release_date": "2024-02-14",
              "title": "Madame Web",
              "video": false,
              "vote_average": 5.621,
              "vote_count": 1250
            },
            {
              "adult": false,
              "backdrop_path": "/iwWSkNdCRjGuyUBolM28xVTcVEg.jpg",
              "genre_ids": [
                18,
                10751
              ],
              "id": 1079810,
              "original_language": "en",
              "original_title": "The Long Game",
              "overview": "In a segregated Texas, five Mexican-American teenage caddies were prohibited from playing at the country club where they worked. Against all odds, they formed their own team, built a one-hole course in the fields, and won the 1957 Texas State championship. Based on a true story.",
              "popularity": 457.676,
              "poster_path": "/eVWHzm6bL4ybAuRLqA10Qo7ACfN.jpg",
              "release_date": "2024-04-12",
              "title": "The Long Game",
              "video": false,
              "vote_average": 5.8,
              "vote_count": 5
            },
            {
              "adult": false,
              "backdrop_path": "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg",
              "genre_ids": [
                16,
                10751,
                35,
                14
              ],
              "id": 508947,
              "original_language": "en",
              "original_title": "Turning Red",
              "overview": "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.",
              "popularity": 423.608,
              "poster_path": "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
              "release_date": "2022-03-10",
              "title": "Turning Red",
              "video": false,
              "vote_average": 7.391,
              "vote_count": 4940
            }
          ],
          "total_pages": 246,
          "total_results": 4918
        }
        """.data(using: .utf8)!
        
        // When
        let movieList = try JSONDecoder().decode(MovieList.self, from: json)
        
        // Then
        XCTAssertEqual(movieList.page, 1)
        XCTAssertEqual(movieList.total_pages, 246)
        XCTAssertEqual(movieList.total_results, 4918)
        XCTAssertEqual(movieList.results?.count, 6)
        XCTAssertEqual(movieList.results?.first?.id, 653346)
        XCTAssertEqual(movieList.results?.first?.title, "Kingdom of the Planet of the Apes")
    }
    
    func testMovieModelReponse() throws {
        // Given
        let json = """
        {
          "adult": false,
          "backdrop_path": "/pwGmXVKUgKN13psUjlhC9zBcq1o.jpg",
          "genre_ids": [
            28,
            14
          ],
          "id": 634492,
          "original_language": "en",
          "original_title": "Madame Web",
          "overview": "Forced to confront revelations about her past, paramedic Cassandra Webb forges a relationship with three young women destined for powerful futures...if they can all survive a deadly present.",
          "popularity": 633.352,
          "poster_path": "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg",
          "release_date": "2024-02-14",
          "title": "Madame Web",
          "video": false,
          "vote_average": 5.621,
          "vote_count": 1250
        }
        """.data(using: .utf8)!
        
        // When
        let movie = try JSONDecoder().decode(Movie.self, from: json)
        
        // Then
        XCTAssertEqual(movie.id, 634492)
        XCTAssertEqual(movie.title, "Madame Web")
        XCTAssertEqual(movie.overview, "Forced to confront revelations about her past, paramedic Cassandra Webb forges a relationship with three young women destined for powerful futures...if they can all survive a deadly present.")
    }
}
