//
//  SecondViewModel.swift
//  Ionex
//
//  Created by sandy.huang on 2023/3/30.
//

import Foundation

class SecondViewModel: NSObject {
    
    func updateUserData(objectId: String, sessionToken: String, parameters: [String: Any], completion: @escaping ((UpdateUserDataService.UserData) -> Void)) {
        UpdateUserDataService().updateUserDataRequest(objectId: objectId, sessionToken: sessionToken, parameters: parameters) { data in
            completion(data)
        }
    }
    
}
