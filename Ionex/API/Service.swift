//
//  Service.swift
//  Ionex
//
//  Created by sandy.huang on 2023/3/30.
//

import Foundation

enum HttpMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

class LoginService {
    
    func loginRequest(parameters: [String: Any], completion: @escaping ((LoginService.LoginData) -> Void)) {
        
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        if let url = URL(string: "https://watch-master-staging.herokuapp.com/api/login") {
            var request = URLRequest (url: url)
            request.httpMethod = HttpMethod.post.rawValue
            request.httpBody = data
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("1", forHTTPHeaderField: "X-Parse-Revocable-Session")
            request.setValue("", forHTTPHeaderField: "X-Parse-REST-API-Key")
            request.setValue("vqYuKPOkLQLYHhk4QTGsGKFwATT4mBIGREI2m8eD", forHTTPHeaderField: "X-Parse-Application-Id")

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print (error.debugDescription)
                } else {
                    if let data = data, let responseData = try? JSONDecoder().decode(LoginData.self, from: data), responseData.sessionToken != nil {
                        completion(responseData)
                        print("responseData === \(responseData)")
                    }
                }
            }
            task.resume()
        }
    }
    
    struct LoginData: Decodable {
        var username: String?
        var phone: String?
        var createdAt: String?
        var updatedAt: String?
        var sessionToken: String?
    }
    
}


class UpdatingService {
    
}
