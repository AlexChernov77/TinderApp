//
//  API_WRAPPER.swift
//  fevronia
//
//  Created by Александр Чернов on 03.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import Foundation
import SwiftyJSON
class API_WRAPPER {
  private  class func makeRequest ( urlString: String ) -> URLRequest {
        let url = URL(string: urlString)!
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue(FVConst.URLMisc.kAccesToken, forHTTPHeaderField: "x-auth-token")
        return urlRequest as URLRequest
    }
    
    
    private class func completionHandler(success: @escaping (JSON)-> Void , failure: (Int) -> Void, data: Data?, response: URLResponse?, error: Error?) {
        
        if error != nil {
            failure((error! as NSError).code)
        } else if data != nil  {
            let jsonResponse = JSON(data!)
           print(jsonResponse)
            DispatchQueue.main.async {
                success(jsonResponse)
            }
        } else {
            failure(-3)
        }
    }
    
    
    
    class func getProfiles(success: @escaping (JSON) -> Void, failure: @escaping (Int) -> Void) {
         let urlString = FVConst.URLEndPoints.kBaseUrl + FVConst.URLEndPoints.kProfiles + "?=fast_match=1&locale=ru"
        let request = CreateRequest.makeRequest(urlString: urlString)
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completionHandler(success: success, failure: failure, data: data, response: response, error: error)
        }
        task.resume()
    }
    
}

