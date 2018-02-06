//
//  DataLayer.swift
//  fevronia
//
//  Created by Александр Чернов on 10.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataLayer {

    
    class func gerGirlsToFuck (success: @escaping (NSArray) -> Void, failure: @escaping (Int) -> Void) {
        API_WRAPPER.getProfiles(success: { (response) in
           let outArray = NSMutableArray()
            let girlsArray = response["results"].arrayValue
            
            for girl in girlsArray {
                let girlModel = FVGirlFabrique.gerFromJSON(json: girl)
                outArray.add(girlModel)
            }
            success(outArray)
        }, failure: failure)
    }
    
    
    class func passLike (id: String) {
        let urlString = FVConst.URLEndPoints.kBaseUrl + FVConst.URLEndPoints.kLike + "\(id)?locale=ru"
        let request = CreateRequest.makeRequest(urlString: urlString)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if data != nil {
                let data = JSON(data)
                print (data)
            }
        })
        task.resume()
    }
    
    class func passDislike (id: String) {
        let urlString = FVConst.URLEndPoints.kBaseUrl + FVConst.URLEndPoints.kDislike + "\(id)?locale=ru"
        let request = CreateRequest.makeRequest(urlString: urlString)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            
            if data != nil {
                let data = JSON(data)
                print (data)
            }
        })
        task.resume()
    }
}
