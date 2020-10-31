//
//  WebService.swift
//  GalleryApp
//
//  Created by Hiram Castro on 10/29/20.
//

import Foundation

enum DataError:Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}

enum HttpMethod:String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url:URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    
    init(url:URL) {
        self.url = url
    }
}

class WebService {
    
    static let shared = {
        return WebService()
    }
    
    private init() {}
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T,DataError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("500pxstefan-skliarovV1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue("f08ba48910mshe7bfa3d88b32d38p1bfd73jsn17e29ddae65c", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("true", forHTTPHeaderField: "useQueryString")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
    
}
