//
//  NetworkManager.swift
//  Weather
//
//  Created by LiewSyetChau on 5/1/22.
//

import Foundation

final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL,
                      completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //if response error
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            //if not http response
            guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                      completion(.failure(.invalidResponse))
                      return
            }
            
            //if invalid data
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            //decode data
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let error {
                print(String(describing: error))
                completion(.failure(.decodeError(err: error.localizedDescription)))
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodeError(err: String)
}
