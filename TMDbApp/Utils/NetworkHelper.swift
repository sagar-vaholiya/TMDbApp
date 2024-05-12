//
//  NetworkHelper.swift
//  TMDbApp

import Foundation
import TMDbNetworkSDK

// MARK: - EndPoint
struct EndPoint {
    // MARK: - relativeURL Enum
    enum RelativeURL: String {
        case latest = "now_playing"
        case popular = "popular"
    }
    
    // MARK: - Properties
    var path: RelativeURL
}

// MARK: - EndPoint Extension
extension EndPoint {
    // MARK: - makeRequest Method
    func makeRequest(queryItems: [URLQueryItem] = []) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/" + path.rawValue
        
        var queries: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
        ]
        queries += queryItems
        
        components.queryItems = queries
        
        guard let url = components.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZDVlNDM3MjJmOTdhM2VhMjZjYzllZDkzYTdmY2M3ZCIsInN1YiI6IjVkODYzOGIwYjc2Y2JiMDAxN2RmYjE1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F2MEutC7CSEqRQb5742YjQkvJLmoCMcoLLqsbC35CMI"
        ]
        request.timeoutInterval = TimeInterval(10)
        return request
    }
}

// MARK: - APIRequest Protocol
protocol APIRequest {
    func getMovies(type: MovieType, page: Int, completion: @escaping ((Result<MovieList?, Error>) -> Void))
}

// MARK: - APIClient Extension
extension APIClient: APIRequest {
    // MARK: - getMovies Method
    func getMovies(type: MovieType, page: Int = 1, completion: @escaping ((Result<MovieList?, Error>) -> Void)) {
        var endPoint: EndPoint
        
        switch type {
        case .latest:
            endPoint = EndPoint(path: .latest)
        case .popular:
            endPoint = EndPoint(path: .popular)
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "page", value: "\(page)"),
        ]
        
        guard let request = endPoint.makeRequest(queryItems: queryItems) else {
            preconditionFailure("Unable to make request")
        }
        
        self.makeDataRequest(urlRequest: request) { result in
            do {
                switch result {
                case .success(let response):
                    guard let res = response else { return }
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(MovieList.self, from: res)
                    completion(.success(responseModel))
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            } catch {
                print("\(#function):\(error.localizedDescription)")
            }
        }
    }
}
