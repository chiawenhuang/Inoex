//
//  ViewModel.swift
//  Ionex
//
//  Created by sandy.huang on 2023/3/30.
//

import Foundation

class FistViewModel: NSObject {
    
    func loginAction(parameters: [String: Any], completion: @escaping ((LoginService.LoginData) -> Void)) {
        LoginService().loginRequest(parameters: parameters) { data in
            completion(data)
        }
    }
    
}
