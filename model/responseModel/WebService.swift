//
//  WebService.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 30.08.2022.
//

import Foundation

class WebService {
    func getUserDetails (url: URL,completion: @escaping((UserDataModel)?) ->() ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data=data{
                let userDetails = try? JSONDecoder().decode(UserDataModel.self, from: data)
                completion(userDetails)
            }
        }.resume()
     
        
        
    
    
    
    
    
    }}
