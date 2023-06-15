//
//  APICaller.swift
//  NetflixClone
//
//  Created by Atharva Dagaonkar on 15/06/23.
//

import Foundation

struct Constants {
    static let API_KEY = "5a4322d5ebe99324250a68279e4444be"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared  = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data,  _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
//                print(results.results[1].original_name)
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
