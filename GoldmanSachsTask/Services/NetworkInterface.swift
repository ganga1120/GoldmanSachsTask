//
//  NetworkInterface.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//

import Foundation

protocol NetworkInterfaceProtocol {
     func request<T:Codable>(serverUrl: String, completion: @escaping (Response<T>) -> ())
}

enum Response<T> {
    case success([T])
    case failure(Error?)
}

struct NetworkInterface: NetworkInterfaceProtocol {
    
    func request<T:Codable>(serverUrl: String, completion: @escaping (Response<T>) -> ()) {
        guard let url = URL(string: serverUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(error))
                return
            }
                      
            do {
                let responseData = try JSONDecoder().decode([T].self, from: data)
                completion(.success(responseData))
            } catch let jsonErr {
                completion(.failure(jsonErr))
            }
        }.resume()
    }
}

struct MockNetworkInterface: NetworkInterfaceProtocol {
    
    func request<T:Codable>(serverUrl: String, completion: @escaping (Response<T>) -> ()) {
        if let url = Bundle.main.url(forResource: serverUrl, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let responseData = try JSONDecoder().decode([T].self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
