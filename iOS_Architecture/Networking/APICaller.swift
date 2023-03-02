//
//  APICaller.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/02.
//

import Foundation

class APICaller {
    enum NetworkError: Error {
        case urlError
        case canNotParseData
    }
    
    static func getTrandingMovies(
        completion: @escaping (_ result: Result<TrandingMoviesModel, NetworkError>) -> Void) {
            let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
            guard let url = URL(string: urlString) else {
                completion(.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil,
                   let data = data,
                   let resultData = try? JSONDecoder().decode(TrandingMoviesModel.self, from: data) {
                    completion(.success(resultData))
                } else {
                    completion(.failure(.canNotParseData))
                }
                
            }.resume()
        }
}
